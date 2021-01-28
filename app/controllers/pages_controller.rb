class PagesController < ApplicationController
  #Allow the user to see the homepage without having to log in
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end
end
