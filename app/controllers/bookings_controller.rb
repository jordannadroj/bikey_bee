class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  before_action :find_bike, only: [:new, :create]

  def index
    # raise
    @bookings = Booking.all
    @bookings = policy_scope(Booking)
  end

  def show
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.find(params[:id])
  end

  def new
    # @bike = Bike.find(params[:bike_id])
    # @user = current_user
    @booking = Booking.new
    authorize @booking
  end

  def create
    # initialize new booking
    @booking = Booking.new(booking_params)
    # find user which is booking bike
    # @bike = Bike.find(params[:bike_id])
    @booking.user = current_user
    authorize @booking
    # set the bookings user id to current user
    @booking.bike = @bike
    # @booking.user = @user
    # save booking
    if @booking.save
      redirect_to bike_booking_path(@bike, @booking)
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def find_bike
    @bike = Bike.find(params[:bike_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
