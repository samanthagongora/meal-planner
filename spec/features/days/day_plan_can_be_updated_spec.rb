require 'rails_helper'

RSpec.describe "User visits account page" do
  scenario "can update a meal plan" do
    user = build(:user)
    recipes = build_list(:recipe, 4)
    day = create(:day, user: user, recipes: recipes)
    new_recipe = create(:recipe)

    visit user_path(user)
    click_on 'Edit Meal Plan'

    select new_recipe.name, from: "day_form_breakfast_id"

    click_on 'Update Meal Plan'

    expect(page).to have_content('Meal Plan Updated!')
    expect(page).to have_content(new_recipe.name)
  end
end
