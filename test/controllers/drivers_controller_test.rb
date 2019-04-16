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
    # Your tests go here
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
