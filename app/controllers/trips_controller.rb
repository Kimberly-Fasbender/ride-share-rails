class TripsController < ApplicationController
  def show
    id = params[:id]
    @trip = Trip.find_by(id: id)
    unless @trip
      head :not_found
    end
  end

  def create
    passenger_id = params[:passenger_id]
    @passenger = Passenger.find_by(id: passenger_id)
    driver = Driver.next_available
    if @passenger && driver
      trip_hash = {
        passenger_id: passenger_id,
        driver_id: driver.id,
        date: Date.current,
        cost: rand(1.65..99.90).round(2),
      }
      trip = Trip.new(trip_hash)
      driver.available = false
      if driver.save && trip.save
        flash[:success] = "Connected to Driver: #{driver.name} for requested trip"
      else
        flash[:error] = "Unable to connect you with a driver at this time."
      end
      redirect_to passenger_path(passenger_id)
    elsif !driver && @passenger
      flash[:error] = "Unable to connect you with a driver at this time."
      redirect_to passenger_path(passenger_id)
    else
      head :not_found
    end
  end

  def update
    @trip = Trip.find_by(id: params[:id])

    if @trip.nil?
      head :not_found
    else
      if @trip.update(trip_params)
        redirect_to trip_path(@trip.id)
      else
        render :edit, status: :bad_request
      end
    end
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
