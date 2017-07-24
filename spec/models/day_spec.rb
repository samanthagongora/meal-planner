require 'rails_helper'
require 'Date'

RSpec.describe Day, type: :model do

  it "is valid with valid attributes" do
    user = create(:user)
    recipes = build_list(:recipe, 4)
    day = Day.create({date: Date.today,
                      user: user,
                      recipes: recipes})

    expect(day).to be_valid
  end

  it "is not valid without user_id" do
    recipes = build_list(:recipe, 4)
    day = Day.create({date: Date.today,
                      recipes: recipes})

    expect(day).to_not be_valid
  end

  it "is not valid without date" do
    user = create(:user)
    recipes = build_list(:recipe, 4)
    day = Day.create({user: user,
                      recipes: recipes})

    expect(day).to_not be_valid
  end

  it "is not valid without recipes" do
    user = create(:user)
    day = Day.create({date: Date.today,
                      user: user})

    expect(day).to_not be_valid
  end

  it "calculates total calories" do
    user = create(:user)
    recipes = build_list(:recipe, 4)
    day = Day.create({date: Date.today,
                      user: user,
                      recipes: recipes})
    calories = recipes[0].calories_per_serving + recipes[1].calories_per_serving + recipes[2].calories_per_serving + recipes[3].calories_per_serving

    expect(day.total_calories).to eq(calories)
  end

  describe "Associations" do
    it { should have_many(:recipes) }
    it { should have_many(:day_recipes) }
    it { should belong_to(:user) }
  end
end
