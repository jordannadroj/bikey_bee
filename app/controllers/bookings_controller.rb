class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :destroy]
  before_action :find_bike, only: [:new, :create]

  def index
    # raise
    @bookings = Booking.all
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    # @bike = Bike.find(params[:bike_id])
    # @user = current_user
    @booking = Booking.new
    authorize @booking
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was succesfully updated.'
    else
      render :edit
    end
    authorize @booking
  end

  def create
    # initialize new booking
    @booking = Booking.new(booking_params)
    # find user which is booking bike
    # @bike = Bike.find(params[:bike_id])
    @booking.user = current_user

    # set the bookings user id to current user
    @booking.bike = @bike
    authorize @booking

    # @booking.user = @user
    # save booking
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render "bikes/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, notice: 'Booking was succesfully cancelled.'
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
