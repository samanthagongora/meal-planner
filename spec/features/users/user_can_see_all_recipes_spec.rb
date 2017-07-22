require 'rails_helper'

RSpec.describe "User visits recipes page" do
  scenario "can see all recipes" do
    user = create(:user)
    recipe1 = create(:recipe)
    recipe2 = create(:recipe)
    recipe3 = create(:recipe)

    visit recipe_path

    expect(page).to have_content(recipe1.name)
    expect(page).to have_content(recipe1.calories)
    expect(page).to have_content(recipe2.name)
    expect(page).to have_content(recipe2.calories)
    expect(page).to have_content(recipe3.name)
    expect(page).to have_content(recipe3.calories)
  end
end
