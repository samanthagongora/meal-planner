class DayRecipesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @day_recipe = DayRecipe.new
    now = DateTime.now
    @date = now.strftime("%A%B%e%Y")
  end
end
