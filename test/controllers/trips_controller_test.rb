require "test_helper"

describe TripsController do
  before do
    passenger = Passenger.new(name: "Anubhav Singh", phone_num: "253-555-1474")
    passenger.save
    driver = Driver.new(name: "George", vin: "X13873487YVW", car_make: "foo", car_model: "bar")
    driver.save
    t = Trip.new(passenger_id: passenger.id, driver_id: driver.id, date: Date.current, cost: 25.0, rating: 3)
    t.save
  end

  describe "show" do
    it "should show page for valid trip" do
      id = Trip.last.id
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
      avail_driver = Driver.next_available
      passenger = Passenger.create(name: "New Anubhav Singh", phone_num: "253-595-1474")
      trip_hash = { trip: {
        passenger_id: passenger.id,
        date: Date.current,
        cost: 25.0,
      } }
      expect {
        post passenger_trips_path(passenger.id), params: trip_hash
      }.must_change "Trip.count", 1
      new_trip = Trip.last
      expect(new_trip.passenger_id).must_equal passenger.id
      expect(new_trip.rating).must_equal nil
      expect(new_trip.driver_id).must_equal avail_driver.id

      avail_driver.reload
      expect(avail_driver.available).must_equal false

      must_respond_with :redirect
      must_redirect_to passenger_path(passenger.id)
      expect(flash[:success]).must_equal "Connected to Driver: #{avail_driver.name} for requested trip"
    end

    it "will redirct and return error message flash if no available drivers" do
      Trip.all.each { |trip| trip.destroy }
      Driver.all.each { |driver| driver.destroy }
      passenger = Passenger.create(name: "New Anubhav Singh", phone_num: "253-595-1474")
      trip_hash = { trip: {
        passenger_id: passenger.id,
        date: Date.current,
        cost: 25.0,
      } }
      expect {
        post passenger_trips_path(passenger.id), params: trip_hash
      }.wont_change "Trip.count"

      must_respond_with :redirect
      must_redirect_to passenger_path(passenger.id)
      expect(flash[:error]).must_equal "Unable to connect you with a driver at this time."
    end
  end

  describe "destroy" do
    # Your tests go here
  end
end
