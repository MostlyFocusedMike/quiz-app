class ApplicationController < ActionController::API

  def user_id
    request.headers['Authorization']
  end

  def current_user
    @user ||= User.find_by(id: user_id)
  end

  def logged_in
    !!current_user
  end

end
