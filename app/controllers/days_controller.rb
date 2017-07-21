require 'date'

class DaysController < ApplicationController
  def new
    @day = Day.new
    @day.user = User.find(params[:user_id])
    @day.date = DateTime.now
  end

  def show
    @day = Day.find(params[:id])
    @recipes = @day.recipes
  end
end
