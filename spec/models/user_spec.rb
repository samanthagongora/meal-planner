require 'rails_helper'

# validates :username, presence: true, uniqueness: true
# validates :password, presence: true
#
# has_many :days
# has_many :day_recipes, through: :days
# has_many :recipes, through: :day_recipes

RSpec.describe User, type: :model do
  user = User.create({username: "anything",
                     password: "anything"})

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without a username" do
    username = nil

    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    password = nil

    expect(user).to_not be_valid
  end
end
