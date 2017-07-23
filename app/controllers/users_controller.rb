class UsersController < ApplicationController
  before_action :authorize_user, only: [:show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @days = @user.days.all
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    flash[:notice] = "Successful login"

    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
