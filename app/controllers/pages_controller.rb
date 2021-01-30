class PagesController < ApplicationController
  def home

  end

  def dashboard
    # collect all booking wheere user id = current user id
    # create route for this dash
    @bookings = Booking.where(user_id: current_user)
  end

  def user_bikes
    @bikes = Bike.where(user_id: current_user)
  end

end
