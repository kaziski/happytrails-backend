class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:session][:username])
     if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      render json: @user
    else
      render json: {
        error: "Invalid Credentials"
      }
    end
  end

  def get_current_user
    if logged_in?
      render json: UserSerializer.new(current_user)
    else
      render json: {
        #I'm handling this in the front - if the error is this,
        #it won't alert. This way, there isn't alert popping up upon every getCurrentUser().
        error: "No one is logged in"
      }
    end
  end

  def destroy
    session.clear
    render json: {
      notice: "Log out success!"
    }, status: :ok
  end
end

