class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    id  = params[:id]
    @trip = Trip.find_by(id: id)
    unless @trip 
      head :not_found
    end
  end

  def create
  end

  def new
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
