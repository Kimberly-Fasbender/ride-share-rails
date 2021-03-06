require "test_helper"

describe DriversController do
  before do
    @driver = Driver.create(
      name: "George",
      vin: "X1838923498",
      car_make: "Honda",
      car_model: "Civic",
    )
  end

  describe "index" do
    it "can get index" do
      get drivers_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "can show an existing valid driver" do
      valid_id = @driver.id

      get driver_path(valid_id)

      must_respond_with :success
    end

    it "will respond with a 404 with an invalid driver id" do
      invalid_driver_id = -3

      get driver_path(invalid_driver_id)

      must_respond_with :not_found
    end
  end

  describe "edit" do
    it "can get the edit page for an existing driver" do
      get edit_driver_path(@driver.id)

      must_respond_with :success
    end

    it "will respond with a 404 when attempting to get the edit page for a non-existant driver" do
      invalid_driver_id = -10

      get edit_driver_path(invalid_driver_id)

      must_respond_with :not_found
    end
  end

  describe "update" do
    it "must be able to update an existing driver" do
      driver_hash = {
        driver: {
          name: "Hey there",
          vin: "JJJJJJ38383838",
        },
      }

      valid_id = @driver.id

      expect {
        patch driver_path(valid_id), params: driver_hash
      }.wont_change "Driver.count"

      @driver.reload

      expect(@driver.name).must_equal(driver_hash[:driver][:name])
      expect(@driver.vin).must_equal(driver_hash[:driver][:vin])

      must_respond_with :redirect
      must_redirect_to driver_path(valid_id)
    end

    it "must respond with a 404 if the driver was not found" do
      driver_hash = {
        driver: {
          name: "Kim",
          vin: "234KER3",
        },
      }

      invalid_id = -30

      expect {
        patch driver_path(invalid_id), params: driver_hash
      }.wont_change "Driver.count"

      must_respond_with :not_found
    end
  end

  describe "new" do
    it "can get the new page" do
      get new_driver_path

      must_respond_with :success
    end
  end

  describe "create" do
    it "can create a new driver" do
      name = "Cecilia"
      vin = "E38497CS983X"
      car_make = "Ford"
      car_model = "Fusion"

      driver_hash = {
        "driver": {
          name: name,
          vin: vin,
          car_make: car_make,
          car_model: car_model,
        },
      }

      # Act-Assert
      expect {
        post drivers_path, params: driver_hash
      }.must_change "Driver.count", 1

      new_driver = Driver.find_by(name: name)
      expect(new_driver.vin).must_equal(vin)

      must_respond_with :redirect
      must_redirect_to driver_path(new_driver.id)
    end
  end

  describe "destroy" do
    it "can delete an existing driver" do
      expect {
        delete driver_path(@driver.id)
      }.must_change "Driver.count", -1

      must_respond_with :redirect
      must_redirect_to drivers_path
    end
  end

  describe "availability" do
    it "can change the driver's availability from true to false and back again" do
      expect(@driver.available).must_equal true

      expect {
        patch availability_path(@driver.id)
      }.wont_change "Driver.count"

      @driver.reload

      must_respond_with :redirect
      must_redirect_to driver_path(@driver.id)
      expect(@driver.available).must_equal false

      patch availability_path(@driver.id)

      @driver.reload
      expect(@driver.available).must_equal true
    end

    it "will render a 404 for an invalid driver id" do
      invalid_id = -50

      expect {
        patch availability_path(invalid_id)
      }.wont_change "Driver.count"

      must_respond_with :not_found
    end
  end
end
