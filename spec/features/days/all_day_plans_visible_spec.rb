require 'rails_helper'

RSpec.describe "See all meals planned" do
  scenario "on user index" do
    user = create(:user)
    recipes = build_list(:recipe, 4)
    day = create(:day, user: user, recipes: recipes)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content(recipes[0].name)
    expect(page).to have_content(recipes[0].calories)
    expect(page).to have_content(recipes[1].name)
    expect(page).to have_content(recipes[1].calories)
    expect(page).to have_content(recipes[2].name)
    expect(page).to have_content(recipes[2].calories)
    expect(page).to have_content(recipes[3].name)
    expect(page).to have_content(recipes[3].calories)
  end
end
