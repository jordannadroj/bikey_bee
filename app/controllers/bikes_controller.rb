class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  def index
    # @bikes = Bike.all
    # raise
    @bikes = policy_scope(Bike)
    if params[:query].present?
      @bikes = Bike.search_by_location_category_and_size(params[:query])
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
    # for adding booking directly on to show page
    @booking = Booking.new
    authorize @booking
    @review = Review.where(bike_id: @bike.id).order("create_at DESC")
  end

  def edit
    @bike = Bike.find(params[:id])
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

  def destroy
    # @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to bikes_path
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
