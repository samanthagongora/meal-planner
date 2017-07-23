require 'rails_helper'

RSpec.describe "Recipe can be updated" do
  scenario "from index page" do
    recipe = create(:recipe)

    visit recipes_path
    click_on 'Edit Recipe'

    fill_in 'Name', with: "New Recipe"

    click_on 'Update Recipe'

    expect(page).to have_content('Recipe Updated!')
    expect(page).to have_content('New Recipe')
    expect(current_path).to be(recipe_path(recipe))
  end

  scenario "from show page" do
    recipe = create(:recipe)

    visit recipe_path(recipe)
    click_on 'Edit Recipe'

    fill_in 'Name', with: "New Recipe"

    click_on 'Update Recipe'

    expect(page).to have_content('Recipe Updated!')
    expect(page).to have_content('New Recipe')
    expect(current_path).to be(recipe_path(recipe))
  end
end
