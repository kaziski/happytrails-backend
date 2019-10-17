class Api::V1::ReviewsController < ApplicationController

  before_action :set_review, only: [:show, :update, :destroy]

  def index
    if logged_in? 
    @reviews = current_user.reviews
    # @reviews = Review.all
    reviews_json = ReviewSerializer.new(@reviews).serialized_json
    render json: reviews_json
    else
      # render json: {
      #   error: "You must be logged in to see reviews"
      # }
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @review
  end

  def create
    @review = Review.new(review_params)  
    
    if @review.save            
      render json: ReviewSerializer.new(@review), status: :created
    else
      resp = {
        error: @review.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
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

    if @review.destroy
      render json:  { data: "Review successfully deleted" }, status: :ok
    else
      error_resp = {
        error: "Review not found and not deleted"
      }
      render json: error_resp, status: :unprocessable_entity
    end
    
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:comment, :api_trail_id, :api_trail_name, :api_trail_url, :user_id, :username)
    end
end
