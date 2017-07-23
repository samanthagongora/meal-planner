require 'rails_helper'

RSpec.feature "User creates a new account" do
  scenario "with valid attributes" do
    user_attributes = {
      username: "laurenf",
      password: "mypassword"
    }

    visit '/users/new'
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    find('input[name="commit"]').click

    user = User.last
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username.capitalize}")
    expect(page).to have_content("Successful login")
  end
end
