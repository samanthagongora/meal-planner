require 'rails_helper'

RSpec.describe "User visits account page" do
  scenario "can delete a meal plan" do
    user = create(:user)
    day1 = create(:day, user: user)
    day2 = create(:day, user: user)

    visit user_path(user)
    click_on 'Delete Meal Plan', match: :first

    expect(page).to have_content('Meal Plan Deleted!')
    expect(page).to have_content(day2.date.strftime('%A, %B %d, %Y'))
  end
end
