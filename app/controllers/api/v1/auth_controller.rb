class Api::V1::AuthController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: {username: user.username, id: user.id}, status: 200
    else
      render json: {error: 'Username or Password Invalid'}, status: 401
    end
  end

  def show
    if logged_in
      render json: {username: current_user.username, id: current_user.id}, status: 200
    else
      render json: {error: 'Token Invalid'}, status: 401
    end
  end

end
