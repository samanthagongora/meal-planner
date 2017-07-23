require 'rails_helper'

# has_many :day_recipes
# has_many :days, through: :day_recipes
#
# validates :name, presence: true, uniqueness: true
# validates :calories, presence: true, numericality: true
# validates :servings, presence: true, numericality: true

RSpec.describe Recipe, type: :model do
  recipe = Recipe.create({name: "anything",
                          calories: 1,
                          servings: 1})

  it "is valid with valid attributes" do
    expect(recipe).to be_valid
  end

  it "is not valid without a name" do
    recipe.name = nil

    expect(recipe).to_not be_valid
  end

  it "is not valid without calories" do
    recipe.calories = nil

    expect(recipe).to_not be_valid
  end

  it "is not valid without servings" do
    recipe.servings = nil

    expect(recipe).to_not be_valid
  end

  describe "Associations" do
    it { should have_many(:days) }
    it { should have_many(:day_recipes) }
  end
end
