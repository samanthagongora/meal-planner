class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :authorize_user

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize_user
    id = params[:user_id] || params[:id]
    render file: '/public/404' unless current_user == User.find(id)
  end
end
