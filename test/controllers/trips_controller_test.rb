require "test_helper"

describe TripsController do
  let(:passenger) {
    Passenger.create(name: "Anubhav Singh", phone_num: "253-555-1474")
  }
  let(:driver) {
    Driver.create(name: "George", vin: "X13873487YVW")
  }
  let(:trip) {
    Trip.create(passenger_id: passenger.id, driver_id: driver.id, date: Date.current, cost: 25.0, rating: 3)
  }
  describe "index" do
    it "should go to index page" do
      get trips_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "should show page for valid trip" do 
      
    end

    it "should return 404 for invalid trip id" do 
    end
  end

  describe "edit" do
    # Your tests go here
  end

  describe "update" do
    # Your tests go here
  end

  describe "create" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end
