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
    @review = Review.new(review_params)  
    #if the review is coming from MyTrails, find a trail from Trails
    #using trail name, then @review.trail_id = Trail[the one found].trail_id
    if @review.save      
      # api_trail_reviews = Review.where(:api_trail_id => @review.api_trail_id)  

# find by name 
# binding.pry
      my_reviews = Review.where(:user_id => current_user.id)
      render json: ReviewSerializer.new(@review), status: :created, my_reviews: my_reviews
      # render json: ReviewSerializer.new(@review), status: :created, api_trail_reviews: api_trail_reviews

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
    @review.destroy
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:comment, :api_trail_id, :api_trail_name, :api_trail_url, :user_id)
    end
end
