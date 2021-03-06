class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @review = Review.new(review_params)
    @review.shop = @shop
    @review.user = current_user
      if @review.save
        respond_to do |format|
          format.html { redirect_to shop_path(@shop) }
          format.js # <-- will render `app/views/reviews/create.js.erb`
        end
        # redirect_to shop_path(@shop)
      else
        respond_to do |format|
          format.html { render :new }
          format.js
        end
      end
  end

  # def show

  # end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
