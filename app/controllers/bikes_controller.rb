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


  def search
    # raise
    if params[:search].blank?
      redirect_to root_path
    else
      @search = params[:search].downcase
      @results = Bike.all.where('lower(location) LIKE :search', search: "%#{@search}%")
    end
  end



  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user

    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :category, :size, :price, :location, :picture, :description)
  end
end
