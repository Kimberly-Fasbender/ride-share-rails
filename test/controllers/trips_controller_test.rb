require "test_helper"

describe TripsController do
  describe "index" do
    it "should go to index page" do
      get trips_path
      must_respond_with :success
    end
  end

  describe "show" do
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
