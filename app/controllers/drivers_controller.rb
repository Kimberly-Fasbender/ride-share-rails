class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:name)
  end

  def show
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
