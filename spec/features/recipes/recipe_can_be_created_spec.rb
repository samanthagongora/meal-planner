require 'rails_helper'

RSpec.describe "Visit recipe index" do
  scenario "can create new recipe" do

    visit recipes_path
    click_on 'Create New Recipe'

    fill_in 'Name', with: 'New Recipe'
    fill_in 'Calories', with: 350
    fill_in 'Servings', with: 8

    click_on 'Create Recipe'

    expect(page).to have_content('Recipe Created!')
    expect(page).to have_content('New Recipe')
  end
end
