class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    flash[:notice] = "Recipe Created!"

    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.update(recipe_params)
    if @recipe
      flash[:notice] = "Recipe Updated!"
    else
      flash[:error] = "Errors Updating Your Recipe!"
    end

    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :calories, :servings)
  end
end
