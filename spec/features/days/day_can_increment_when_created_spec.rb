require 'rails_helper'
require 'date'

RSpec.describe "Visits new day page" do
  scenario "cannot create a duplicate day record" do
    user = create(:user)
    day1 = create(:day, date: Date.today, user: user)

    visit new_user_day_path(user)

    next_date = day1.date + 1
    expect(page).to have_content(next_date.strftime('%A, %B %d, %Y'))
  end
end
