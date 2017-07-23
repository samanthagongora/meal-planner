require 'rails_helper'

RSpec.feature "User visits unauthorized pages" do
  scenario "cannot see pages" do
    user1 = create(:user)
    user2 = create(:user)
    day = create(:day, user: user2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit "/users/#{user2.id}"
    expect(page).to have_content("404")

    visit "/users/#{user2.id}/days/new"
    expect(page).to have_content("404")

    visit "/users/#{user2.id}/days/#{day.id}/edit"
    expect(page).to have_content("404")

    visit "/users/#{user2.id}/days/#{day.id}"
    expect(page).to have_content("404")
  end
end
