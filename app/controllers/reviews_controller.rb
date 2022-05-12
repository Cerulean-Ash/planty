class ReviewsController < ApplicationController
  def new
    find_purchase
    @review = Review.new
  end

  def create
    find_purchase
    @review = Review.new(review_params)
    @review.purchase = @purchase
    if @review.save
      # back to user dashboard here? We can see if this works
      redirect_to user_path(@purchase.user)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def find_purchase
    @purchase = Purchase.find(params[:purchase_id])
  end
end
