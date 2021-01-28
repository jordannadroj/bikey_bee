class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  def index
    # @bikes = Bike.all
    @bikes = policy_scope(Bike)
    # authorize @bikes
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
    authorize @bike
  end



  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    authorize @bike

    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def update
    if @bike.update(bike_params)
      redirect_to @bike, notice: 'Bike was succesfully updated.'
    else
      render :edit
    end
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
    authorize @bike
  end

  def bike_params
    params.require(:bike).permit(:name, :category, :size, :price, :location, :picture, :description)
  end
end
