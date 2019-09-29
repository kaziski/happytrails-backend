class Api::V1::ReviewsController < ApplicationController

  before_action :set_review, only: [:show, :update, :destroy]

  def index
    if logged_in? 
    @reviews = current_user.reviews
    # @reviews = Review.all
    reviews_json = ReviewSerializer.new(@reviews).serialized_json
    render json: reviews_json
    else
      render json: {
        error: "You must be logged in to see reviews"
      }
    end
  end

  def show
    render json: @review
  end

  def create
    @review = Trail.new(review_params)

    if @review.save
      render json: @review, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
  end

  private
    def set_review
      @review = Trail.find(params[:id])
    end

    def review_params
      params.require(:trail).permit(:comment, :trail_id, :user_id)
    end
end
