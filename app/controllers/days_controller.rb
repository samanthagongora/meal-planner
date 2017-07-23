require 'date'

class DaysController < ApplicationController
  before_action :authorize_user

  def new
    @day = Day.new
    @day.user = User.find(params[:user_id])
    @day.date = Date.today
    while Day.find_by(date: @day.date)
      @day.date += 1
    end
  end

  def show
    @day = Day.find(params[:id])
    @recipes = @day.recipes
  end

  def edit
    @day = Day.find(params[:id])
  end

  def destroy
    @day = Day.find(params[:id])
    @user = @day.user

    if @day.destroy
      flash[:notice] = "Meal Plan Deleted!"
      redirect_to user_path(@user)
    else
      flash[:error] = "Error Deleting Meal Plan!"
      redirect_to user_path(@user)
    end
  end
end
