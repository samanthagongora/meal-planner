class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :authorize_user

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    render file: '/public/404' unless current_user.id == params[:id].to_i
  end
end
