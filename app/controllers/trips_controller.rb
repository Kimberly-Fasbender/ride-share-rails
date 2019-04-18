class TripsController < ApplicationController
  def show
    id = params[:id]
    @trip = Trip.find_by(id: id)
    unless @trip
      head :not_found
    end
  end

  def create
  end

  def update
  end

  def edit
    id = params[:id]
    @trip = Trip.find_by(id: id)
    unless @trip
      head :not_found
    end
  end

  def destroy
  end

  private

  def trip_params
    return params.require(:trip).permit(:cost, :driver_id, :passenger_id, :date, :rating)
  end
end
