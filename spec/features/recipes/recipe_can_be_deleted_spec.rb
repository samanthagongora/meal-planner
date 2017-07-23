require 'rails_helper'

RSpec.describe "Recipe can be deleted" do
  scenario "from index page" do
    recipe1 = create(:recipe)
    recipe2 = create(:recipe)

    visit recipes_path
    click_on 'Delete Recipe', match: :first

    expect(page).to have_content('Recipe Deleted!')
    expect(page).to have_content(recipe2.name)
    expect(page).to_not have_content(recipe1.name)
    expect(current_path).to eq("/recipes")
  end

  scenario "from show page" do
    recipe1 = create(:recipe)
    recipe2 = create(:recipe)

    visit recipe_path(recipe1)
    click_on 'Delete Recipe'

    expect(page).to have_content('Recipe Deleted!')
    expect(page).to have_content(recipe2.name)
    expect(page).to_not have_content(recipe1.name)
    expect(current_path).to eq("/recipes")
  end
end
