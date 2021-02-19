class PagesController < ApplicationController
  # Allow the user to see the homepage without having to log in
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    # collect all booking wheere user id = current user id
    # create route for this dash
    @bookings = Booking.where(user_id: current_user).order(:start_date)
  end

  def user_bikes
    @bikes = Bike.where(user_id: current_user)
  end
end
