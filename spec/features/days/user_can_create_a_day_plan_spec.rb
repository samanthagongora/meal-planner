require 'rails_helper'

RSpec.describe "User visits day route" do
  scenario "user can create a meal plan" do
    user = create(:user)
    recipe = create(:recipe)

    visit user_path(user)
    click_on 'Create New Meal Plan'
    select recipe.name, from: "day_recipe_id"
    select recipe.name, from: "day_recipe_id"
    select recipe.name, from: "day_recipe_id"
    click_on 'Create Meal Plan'

    expect(page).to have_content('Meal Plan Created!')
    expect(current_path).to be('user/:id')
  end
end
