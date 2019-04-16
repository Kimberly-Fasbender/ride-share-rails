class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    id = params[:id]
    @passenger = Passenger.find_by(id: id)
    unless @passenger
      flash[:error] = "Could not find Passenger with ID: #{id}"
      redirect_to passengers_path
    end
  end

  def edit
    id = params[:id]
    @passenger = Passenger.find_by(id: id)
    unless @passenger
      flash[:error] = "Could not find Passenger with ID: #{id}"
      redirect_to passengers_path
    end
  end

  def new
    @passenger = Passenger.new
  end

  def update
  end

  def create
  end

  def destroy
  end
end
