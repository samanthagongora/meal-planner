require 'rails_helper'

RSpec.describe "User visits welcome page" do
  it "can see welcome and login button" do
    visit '/'

    expect(page).to have_content("Welcome to Meal Planner")
    expect(page).to have_link("Login")
  end
end
