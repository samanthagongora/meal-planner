require 'rails_helper'
require 'date'

RSpec.describe "Visits new day page" do
  scenario "cannot create a duplicate day record" do
    user = create(:user)
    recipes = build_list(:recipe, 4)
    day1 = create(:day, date: Date.today, user: user, recipes: recipes)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_user_day_path(user)

    next_date = day1.date + 1
    expect(page).to have_content(next_date.strftime('%A, %B %d, %Y'))
  end
end
