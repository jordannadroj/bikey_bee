class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
    @bikes = Bike.where.not(latitude: nil, longitude: nil)
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude
      }
    end
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike.current_user
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to bikes_path(@bike)
    else
      render :new
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :category, :size, :price, :location)
  end
end
