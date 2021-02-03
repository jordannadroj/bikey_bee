class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_bike

  def new
    @bike = Bike.find(params[:bike_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    # @bike = Bike.find(params[:bike_id])
    @review.bike_id = @bike.id
    @review.user_id = current_user.id
    authorize @review

    if @review.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to bike_path(@bike)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
