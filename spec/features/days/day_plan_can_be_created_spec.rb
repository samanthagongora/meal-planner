require 'rails_helper'

RSpec.describe "User visits day route" do
  scenario "user can create a meal plan" do
    user = create(:user)
    recipe = create(:recipe)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    click_button 'Create New Meal Plan'

    select recipe.name, from: "day_form_breakfast_id"
    select recipe.name, from: "day_form_lunch_id"
    select recipe.name, from: "day_form_dinner_id"
    select recipe.name, from: "day_form_snack_id"

    click_button 'Create Meal Plan'

    expect(page).to have_content('Meal Plan Created!')
  end
end
