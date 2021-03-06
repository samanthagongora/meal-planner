require 'rails_helper'

RSpec.describe "User can delete meal plan" do
  scenario "from index page" do
    user = create(:user)
    recipes = build_list(:recipe, 4)
    day1 = create(:day, user: user, recipes: recipes)
    day2 = create(:day, user: user, recipes: recipes)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    click_on 'Delete Meal Plan', match: :first

    expect(page).to have_content('Meal Plan Deleted!')
    expect(page).to have_content(day2.date.strftime('%A, %B %d, %Y'))
  end

  scenario "from show page" do
    user = create(:user)
    recipes = build_list(:recipe, 4)
    day1 = create(:day, user: user, recipes: recipes)
    day2 = create(:day, user: user, recipes: recipes)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_day_path(user, day1)
    click_on 'Delete Meal Plan'

    expect(page).to have_content('Meal Plan Deleted!')
    expect(page).to have_content(day2.date.strftime('%A, %B %d, %Y'))
  end
end
