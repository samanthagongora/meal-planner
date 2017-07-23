require 'rails_helper'

RSpec.describe "User visits account page" do
  scenario "user can see meals planned" do
    user = create(:user)
    day = create(:day, user: user)
    recipe1 = create(:recipe)
    recipe2 = create(:recipe)
    day_recipe1 = create(:day_recipe, day: day, recipe: recipe1)
    day_recipe2 = create(:day_recipe,day: day , recipe: recipe2)

    visit user_path(user)

    expect(page).to have_content(recipe1.name)
    expect(page).to have_content(recipe1.calories)
    expect(page).to have_content(recipe2.name)
    expect(page).to have_content(recipe2.calories)
  end
end
