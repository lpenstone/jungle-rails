class ReviewsController < ApplicationController
  before_filter :authorize
  def create
    @review = Review.new(
      rating: review_params[:rating],
      description: review_params[:description],
      user_id: current_user.id,
      product_id: params["product_id"]
      )
    if @review.save
      redirect_to product_path(@review.product), notice: 'Review posted!'
    else
      @product = @review.product
      @reviews = @product.reviews
      puts "comment did not save"
      render "products/show"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product), notice: 'Review has been deleted!'
  end

  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end

end
