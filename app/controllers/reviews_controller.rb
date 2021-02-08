class ReviewsController < ApplicationController
  before_action :set_bike, except: [:edit, :update, :destroy]
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
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
      redirect_to bike_path(@bike, anchor: "review-")
    else
      render :new
    end
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    if @review.update(review_params)
      # authorize @review
      redirect_to bike_path(@review.bike)
    else
      # authorize @review
      render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    authorize @review
    redirect_to bike_path(@review.bike)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
