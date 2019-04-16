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
    # Your tests go here
  end

  describe "new" do
    it "will go to new form page if valid id" do
      id = Passenger.first.id
      get new_passenger_path(id)
      must_respond_with :success
    end

    it "will redirct to index if invalid id is used" do
      invalid_id = -1
      get new_passenger_path(invalid_id)
      must_respond_with :redirect
      must_redirect_to passengers_path
    end
  end

  describe "create" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end
