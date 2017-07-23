require 'rails_helper'

RSpec.describe "Meal plan can be updated" do
  scenario "from index page" do
    user = create(:user)
    recipes = build_list(:recipe, 4)
    day = create(:day, user: user, recipes: recipes)
    new_recipe = create(:recipe)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    click_on 'Edit Meal Plan'

    select new_recipe.name, from: "day_form_breakfast_id"

    click_on 'Update Meal Plan'

    expect(page).to have_content('Meal Plan Updated!')
    expect(page).to have_content(new_recipe.name)
  end

  scenario "from show page" do
    user = create(:user)
    recipes = build_list(:recipe, 4)
    day = create(:day, user: user, recipes: recipes)
    new_recipe = create(:recipe)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    click_on day.date.strftime('%A, %B %d, %Y')
    click_on 'Edit Meal Plan'

    select new_recipe.name, from: "day_form_breakfast_id"

    click_on 'Update Meal Plan'

    expect(page).to have_content('Meal Plan Updated!')
    expect(page).to have_content(new_recipe.name)
  end
end
