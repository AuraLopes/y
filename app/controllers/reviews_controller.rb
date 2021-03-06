class ReviewsController < ApplicationController
  before_action :set_restaurant, except: [:destroy]

   # GET /restaurants/:restaurant_id/reviews/new
   def new
    @review = Review.new
   end

  def create
    @review = Review.new(review_params)

    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
     @review = Review.find(params[:id])
     @review.destroy

     redirect_to restaurant_path(@review.restaurant)
  end

  private

  def set_restaurant
     @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
