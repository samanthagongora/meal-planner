require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create({username: "anything",
                     password: "anything"})

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without a username" do
    user.username = nil

    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    user.password = nil

    expect(user).to_not be_valid
  end

  describe "Associations" do
    it { should have_many(:days) }
    it { should have_many(:day_recipes) }
    it { should have_many(:recipes) }
  end
end
