class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new({
      user_id: current_user.id,
      description: params[:review][:description],
      rating: params[:review][:rating]
    })
    @review.save
    redirect_to @product
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy

    redirect_to @product
  end

  private
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to perform that action"
      redirect_to '/login'
    end
  end
end
