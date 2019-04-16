require "test_helper"

describe TripsController do
  before do
    passenger = Passenger.create(name: "Anubhav Singh", phone_num: "253-555-1474")
    driver = Driver.create(name: "George", vin: "X13873487YVW")
    Trip.create(passenger_id: passenger.id, driver_id: driver.id, date: Date.current, cost: 25.0, rating: 3)
  end
  describe "index" do
    it "should go to index page" do
      p Trip.all
      get trips_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "should show page for valid trip" do
      id = Trip.first.id
      get trip_path(id)
      must_respond_with :success
    end

    it "should return 404 for invalid trip id" do
      invalid_id = -1
      get trip_path(invalid_id)
      must_respond_with :not_found
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
