require 'rails_helper'

RSpec.describe "Visits day page" do
  scenario "can delete a meal plan" do
    user = create(:user)
    day1 = create(:day, user: user)
    day2 = create(:day, user: user)

    visit user_day_path(user, day1)
    click_on 'Delete Meal Plan'

    expect(page).to have_content('Meal Plan Deleted!')
    expect(page).to have_content(day2.date.strftime('%A, %B %d, %Y'))
  end
end
