class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    id = params[:id]
    @passenger = Passenger.find_by(id: id)
    head :not_found unless @passenger
  end

  def edit
    id = params[:id]
    @passenger = Passenger.find_by(id: id)
    head :not_found unless @passenger
  end

  def new
    @passenger = Passenger.new
  end

  def update
    id = params[:id]
    @passenger = Passenger.find_by(id: id)
    if @passenger && @passenger.update(passenger_params)
      redirect_to passenger_path(@passenger)
    else
      render :edit, status: :bad_request
    end
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger && @passenger.save
      redirect_to passengers_path
    else
      render :edit, status: :bad_request
    end
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
