require "test_helper"

describe DriversController do
  describe "index" do
    it "can get index" do
      get drivers_path

      must_respond_with :success
    end
  end

  describe "show" do
    it "can show an existing valid driver" do
      driver = Driver.create(name: "George", vin: "X13873487YVW")
      valid_id = driver.id

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
      driver = Driver.create(name: "Sally", vin: "YX83792834B")

      get edit_driver_path(driver.id)

      must_respond_with :success
    end

    it "will respond with a 404 when attempting to get the edit page for a non-existant driver" do
      invalid_driver_id = -10

      get edit_driver_path(invalid_driver_id)

      must_respond_with :not_found
    end
  end

  describe "update" do
    # Your tests go here
  end

  describe "new" do
    # Your tests go here
  end

  describe "create" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end
