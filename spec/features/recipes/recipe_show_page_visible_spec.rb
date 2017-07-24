require 'rails_helper'

RSpec.describe "User visits recipe page" do
  scenario "can see recipe details" do
    recipe = create(:recipe)

    visit recipe_path(recipe)

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.calories)
    expect(page).to have_content(recipe.servings)
    expect(page).to have_content(recipe.calories_per_serving)
  end
end
