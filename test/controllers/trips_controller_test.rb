require "test_helper"

describe TripsController do
  before do
    passenger = Passenger.create(name: "Anubhav Singh", phone_num: "253-555-1474")
    driver = Driver.create(name: "George", vin: "X13873487YVW", car_make: "", car_model: "")
    Trip.create(passenger_id: passenger.id, driver_id: driver.id, date: Date.current, cost: 25.0, rating: 3)
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
    passenger = Passenger.create(name: "Anubhav Singh", phone_num: "253-555-1474")
    driver = Driver.create(name: "George", vin: "X13873487YVW", car_make: "", car_model: "")
    Trip.create(passenger_id: passenger.id, driver_id: driver.id, date: Date.current, cost: 25.0, rating: 3)
    it "can get the edit page" do
      get edit_trip_path(Trip.last.id)

      must_respond_with :success
    end

    it "will respond with a 404 for an invalid id" do
      invalid_id = -5

      get edit_trip_path(invalid_id)

      must_respond_with :not_found
    end
  end

  describe "update" do
    # Your tests go here
  end

  describe "create" do
    it "will create a new trip" do
      passenger = Passenger.create(name: "New Anubhav Singh", phone_num: "253-595-1474")
      driver = Driver.create(name: "New George", vin: "X12273487YVW", car_make: "", car_model: "")
      trip_hash = { trip: { driver_id: driver.id,
                            passenger_id: passenger.id,
                            date: Date.current,
                            cost: 25.0,
                            rating: 3 } }
      expect {
        post trips_path, params: trip_hash
      }.must_change "Trip.count", 1
      new_trip = Trip.last
      expect(new_trip.passenger_id).must_equal passenger.id
      expect(new_trip.driver_id).must_equal driver.id
      expect(new_trip.rating).must_equal 3

      must_respond_with :redirect
      must_redirect_to trip_path(new_trip.id)
    end
  end

  describe "destroy" do
    # Your tests go here
  end
end
