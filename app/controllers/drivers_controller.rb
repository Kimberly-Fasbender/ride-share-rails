class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:name)
  end

  def show
    @driver = Driver.find_by(id: params[:id])

    head :not_found if @driver.nil?
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to driver_path(@driver.id)
    else
      render :new, status: :bad_request
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])

    head :not_found if @driver.nil?
  end

  def update
    @driver = Driver.find_by(id: params[:id])

    if @driver.nil?
      head :not_found
    else
      if @driver.update(driver_params)
        redirect_to driver_path(@driver.id)
      else
        render :edit, status: :bad_request
      end
    end
  end

  def destroy
    driver = Driver.find_by(id: params[:id])

    if driver.nil?
      head :not_found
    else
      driver.trips.each do |trip|
        trip.update(driver_id: 0)
      end
      driver.destroy
      redirect_to drivers_path
    end
  end

  def availability
    driver = Driver.find_by(id: params[:id])

    !driver ? (head :not_found) : driver.toggle(:available)
    redirect_to driver_path(driver.id)
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin, :car_make, :car_model)
  end
end
