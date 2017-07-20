class AddMealToDayRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :day_recipes, :meal, :string
  end
end
