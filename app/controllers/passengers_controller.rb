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
    id = params[:id]
    passenger = Passenger.find_by(id: id)
    if passenger && passenger.update(passenger_params)
      redirect_to passenger_path(passenger)
    else
      head :not_found
    end
  end

  def create
    passenger = Passenger.new(passenger_params)
    unless passenger.save # was getting duplicate key assignment error, ran this command in console ActiveRecord::Base.connection.reset_pk_sequence!('passengers')
      flash[:error] = "Unable to add Passenger, please try again."
      head :bad_request # returns 400 then redirects, can I do this?
    end
    redirect_to passengers_path
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id])
    if passenger
      passenger.destroy
      redirect_to passengers_path
    else
      head :not_found
    end
  end

  private

  def passenger_params
    return params.required(:passenger).permit(:name, :phone_num)
  end
end
