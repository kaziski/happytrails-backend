class Api::V1::TrailsController < ApplicationController

  before_action :set_trail, only: [:show, :update, :destroy]

  def index
    @trails = Trail.all
    render json: @trails
  end

  def show
    render json: @trail
  end

  def create
    @trail = Trail.new(trail_params)

    if @trail.save
      render json: @trail, status: :created, location: @trail
    else
      render json: @trail.errors, status: :unprocessable_entity
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
      params.require(:trail).permit(:name, :length)
    end
end
