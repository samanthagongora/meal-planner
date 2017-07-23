require 'rails_helper'

RSpec.describe Day, type: :model do
  day = create(:day)
  recipe = create(:recipe)
  day_recipe = DayRecipe.create({day: day,
                                 recipe: recipe})

  it "is valid with valid attributes" do
    expect(day_recipe).to be_valid
  end

  it "is invalid without day" do
    day_recipe.day = nil

    expect(day_recipe).to_not be_valid
  end

  it "is invalid without recipe" do
    day_recipe.recipe = nil

    expect(day_recipe).to_not be_valid
  end

  describe "Associations" do
    it { should belong_to(:recipe) }
    it { should belong_to(:day) }
  end
end
