require 'rails_helper'

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

  it "is not valid without calories or number of calories" do
    recipe.calories = nil
    expect(recipe).to_not be_valid

    recipe.calories = "string"
    expect(recipe).to_not be_valid
  end

  it "is not valid without servings or number of servings" do
    recipe.servings = nil
    expect(recipe).to_not be_valid

    recipe.servings = "string"
    expect(recipe).to_not be_valid
  end

  it "can calculate calories per serving" do
    recipe = Recipe.create({name: "anything",
                            calories: 100,
                            servings: 2})

    expect(recipe.calories_per_serving).to eq(50)
  end

  describe "Associations" do
    it { should have_many(:days) }
    it { should have_many(:day_recipes) }
  end
end
