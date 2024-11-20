class ReviewsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
  end

  def show
    @review = Review.find(params[:id])
    @restaurant = @review.restaurant
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to restaurant_reviews_path(@review.restaurant), status: :see_other, notice: "Review destroyed"
    end
  end
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: "Review saved"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def review_params
    params.require(:review).permit(:content)
  end
end
