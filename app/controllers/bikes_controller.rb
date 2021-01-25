class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def new
    @bike = Bike.new
  end

  def create
    current_user # how can i appoint the current_user by default?
    raise
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to bikes_path(@bike)
    else
      render :new
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :category, :size, :price, :location, :user_id)
  end
end
