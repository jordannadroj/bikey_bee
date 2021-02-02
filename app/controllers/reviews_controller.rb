class ReviewsController < ApplicationController
  def new
    @bike = Bike.find(params[:bike_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @bike = Bike.find(params[:bike_id])
    @review.bike = @bike
    authorize @review

    if @review.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
