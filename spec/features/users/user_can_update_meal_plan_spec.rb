require 'rails_helper'

RSpec.describe "User visits account page" do
  scenario "can update a meal plan" do
    user = create(:user)
    recipe1 = create(:recipe)
    recipe2 = create(:recipe)
    day = create(:day, user: user)
    day_recipe = create(:day_recipe, day: day, recipe: recipe1)

    visit user_path(user)
    click_on 'Edit Meal Plan'

    select recipe2.name, from: "day_form_breakfast_id"

    click_on 'Update Meal Plan'

    expect(page).to have_content('Meal Plan Updated!')
    expect(page).to have_content(recipe2.name)
  end
end
