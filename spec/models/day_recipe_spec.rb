require 'rails_helper'

RSpec.describe DayRecipe, type: :model do

  it "is valid with valid attributes" do
    recipes = build_list(:recipe, 4)
    day = create(:day, recipes: recipes)
    day_recipe = DayRecipe.create({day: day,
                                   recipe: day.recipes[0]})

    expect(day_recipe).to be_valid
  end

  it "is invalid without day" do
    recipes = build_list(:recipe, 4)
    day_recipe = DayRecipe.create({recipe: recipes[0]})

    expect(day_recipe).to_not be_valid
  end

  it "is invalid without recipe" do
    recipes = build_list(:recipe, 4)
    day = create(:day, recipes: recipes)
    day_recipe = DayRecipe.create({day: day})

    expect(day_recipe).to_not be_valid
  end

  describe "Associations" do
    it { should belong_to(:recipe) }
    it { should belong_to(:day) }
  end
end
