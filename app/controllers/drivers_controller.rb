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
    driver = Driver.new(driver_params)
    # works for now, but seems pretty hacky....
    driver.id = Driver.last.id + 1

    is_successful = driver.save

    if is_successful
      redirect_to driver_path(driver.id)
    else
      head :bad_request
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])

    head :not_found if @driver.nil?
  end

  def update
    driver = Driver.find_by(id: params[:id])

    if driver.nil?
      head :not_found
    else
      is_successful = driver.update(driver_params)
      redirect_to driver_path(driver.id)
    end
  end

  def destroy
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
