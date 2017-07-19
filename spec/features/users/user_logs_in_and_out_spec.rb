require "rails_helper"

RSpec.feature "User logs in and out" do
  scenario "with valid credentials" do
    user_attributes = {
      username: "rachelw",
      password: "secretpassword"
    }

    user = User.create(user_attributes)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "session[password]", with: user_attributes[:password]

    find('input[name="commit"]').click

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username.capitalize}")
    expect(page).to have_content("Successful login")

    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("#{user.username.capitalize}")
    expect(page).to have_content("Goodbye")
  end
end
