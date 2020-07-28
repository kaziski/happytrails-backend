class Api::V1::TrailsController < ApplicationController

  before_action :set_trail, only: [:show, :update, :destroy]

  def index
    @trails = Trail.where(:user_id => current_user.id)
    trails_json = TrailSerializer.new(@trails).serialized_json
    render json: trails_json
  end

  def show
    trail_json = TrailSerializer.new(@trail).serialized_json
    render json: trail_json
  end

  def create
    # this is trail coming in
      @trail = Trail.new(trail_params)
      # trails belong to the user
      trails = Trail.where(:user_id => current_user.id)
      #see if @trail already exist
      dupes = trails.where(:name => @trail.name)

      if dupes.empty?
        @trail.save

        render json: TrailSerializer.new(@trail), status: :created
      else
        resp = {
          error: @trail.errors.full_messages.to_sentence
          #figre out a way to print this msg when appropreate`
          # error: "You've saved the trail already."
        }
        render json: resp, status: :unprocessable_entity
      end
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
      params.require(:trail).permit(:name, :length, :url, :imgSmallMed, :summary, :longitude, :latitude, :user_id, :api_trail_id)
    end

