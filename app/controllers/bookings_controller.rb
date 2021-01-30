class BookingsController < ApplicationController
  def index
    # raise
    @bookings = Booking.all
  end

  def show
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.find(params[:id])
  end

  def new
    @bike = Bike.find(params[:bike_id])
    # @user = current_user
    @booking = Booking.new
  end

  def create
    # initialize new booking
    @booking = Booking.new(booking_params)
    # find user which is booking bike
    @bike = Bike.find(params[:bike_id])
    @user = current_user
    # set the bookings user id to current user
    @booking.bike = @bike
    @booking.user = @user
    # save booking
    if @booking.save
      redirect_to bike_booking_path(@bike, @booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
