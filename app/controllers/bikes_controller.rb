class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  def index
    # @bikes = Bike.all
    @bikes = policy_scope(Bike)
    if params[:query].present?
      @bikes = Bike.search_by_location_and_category(params[:query])
    else
      @bikes = Bike.all
    end
    # authorize @bikes
  end

  def show
    @bike = Bike.find(params[:id])
      if @bike.latitude && @bike.longitude
        @marker = {
          lat: @bike.latitude,
          lng: @bike.longitude,
          infoWindow: render_to_string(partial: "map_box", locals: { bike: @bike })
        }
      end
  end

  def search
    # raise
    @bikes = Bike.all
    if params[:search].blank?
      redirect_to bikes_path
    else
      @search = params[:search].downcase
      # @bikes = Bike.all.where('lower(location) LIKE :search', search: "%#{@search}%")
      @bikes = Bike.near(@search, 25)
    end
    authorize @bikes
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
