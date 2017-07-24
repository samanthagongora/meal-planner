require 'rails_helper'

RSpec.describe "User visits recipes page" do
  scenario "can see all recipes" do
    recipe1 = create(:recipe)
    recipe2 = create(:recipe)
    recipe3 = create(:recipe)

    visit recipes_path

    expect(page).to have_content(recipe1.name)
    expect(page).to have_content(recipe1.calories_per_serving)
    expect(page).to have_content(recipe1.servings)

    expect(page).to have_content(recipe2.name)
    expect(page).to have_content(recipe2.calories_per_serving)
    expect(page).to have_content(recipe2.servings)

    expect(page).to have_content(recipe3.name)
    expect(page).to have_content(recipe3.calories_per_serving)
    expect(page).to have_content(recipe3.servings)
  end
end
