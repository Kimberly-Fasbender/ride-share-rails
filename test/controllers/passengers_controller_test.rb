require "test_helper"

describe PassengersController do
  let(:passenger) {
    Passenger.create(name: "Anubhav Singh", phone_num: "253-555-1474")
  }
  describe "index" do
    it "should get index" do
      get passengers_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "will show valid passenger page if passed valid id" do
      id = Passenger.first.id
      get passenger_path(id)
      must_respond_with :success
    end

    it "will return to index if invalid id is used" do
      invalid_id = -1
      get passenger_path(invalid_id)
      must_respond_with :redirect
      must_redirect_to passengers_path
    end
  end

  describe "edit" do
    it "will go to edit form page if valid id" do
      id = Passenger.first.id
      get edit_passenger_path(id)
      must_respond_with :success
    end

    it "will redirct to index if invalid id is used" do
      invalid_id = -1
      get edit_passenger_path(invalid_id)
      must_respond_with :redirect
      must_redirect_to passengers_path
    end
  end

  describe "update" do
    it "should update valid passenger" do
      passenger = Passenger.last
      passenger_hash = {
        passenger: {
          name: "Updated Passenger",
          phone_num: "253-555-update",
        },
      }
      expect {
        patch passenger_path(passenger.id), params: passenger_hash
      }.wont_change "Passenger.count"

      must_respond_with :redirect
      must_redirect_to passenger_path

      passenger.reload
      expect(passenger.name).must_equal "Updated Passenger"
      expect(passenger.phone_num).must_equal "253-555-update"
    end

    it "will return 404 if invalid id is updated" do
      invalid_id = -1
      passenger_hash = {
        passenger: {
          name: "Update invalidd Passenger",
          phone_num: "253-555-invalidupdate",
        },
      }
      expect {
        patch passenger_path(invalid_id), params: passenger_hash
      }.wont_change "Passenger.count"

      must_respond_with :not_found
    end
  end

  describe "new" do
    it "should get to new page" do
      get new_passenger_path
      must_respond_with :success
    end
  end

  describe "create" do
    it "will create a new passenger" do
      passenger_hash = {
        passenger: {
          name: "Harry Thumblina",
          phone_num: "253-555-2609",
        },
      }

      expect {
        post passengers_path, params: passenger_hash
      }.must_change "Passenger.count", 1

      new_passenger = Passenger.last
      expect(new_passenger.name).must_equal "Harry Thumblina"
      expect(new_passenger.phone_num).must_equal "253-555-2609"
    end

    #   it "will be redirected if given invalid params" do  #<-- will need this later ?
    # end
  end

  describe "destroy" do
    it "should remove passenger entry from db" do 
      passenger = Passenger.last
      
    end

    it "should return 404 if passenger id is invalid" do 
    end
  end
end
