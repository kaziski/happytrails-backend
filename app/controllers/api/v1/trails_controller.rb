class Api::V1::TrailsController < ApplicationController

  before_action :set_trail, only: [:show, :update, :destroy]

  def index
    @trails = Trail.all
    trails_json = TrailSerializer.new(@trails).serialized_json
    render json: trails_json
  end

  def show
    trail_json = TrailSerializer.new(@trail).serialized_json
    render json: trail_json
  end

  def create
    @trail = Trail.new(trail_params)
    if @trail.save
      render json: TrailSerializer.new(@trail), status: :created
    else
      resp = {
        error: @trail.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def update
    if @trail.update(trail_params)
      render json: @trail
    else
      render json: @trail.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @trail.destroy
  end

  private
    def set_trail
      @trail = Trail.find(params[:id])
    end

    def trail_params
      params.require(:trail).permit(:name, :length, :url, :longitude, :latitude, :user_id)
    end
end
