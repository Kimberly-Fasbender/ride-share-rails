class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:name)
  end

  def show
    @driver = Driver.find_by(id: params[:id])

    head :not_found if @driver.nil?
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
