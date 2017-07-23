require 'rails_helper'

RSpec.describe DayForm, type: :model do

  it "is valid with valid attributes" do
    recipes = build_list(:recipe, 4)
    day = create(:day, recipes: recipes)
    user = create(:user)
    attributes = {date: day, user: user}
    dayform = DayForm.new(date: day, user_id: user)

    expect(dayform).to be_valid
  end

  it "is invalid without date" do
    user = create(:user)
    dayform = DayForm.new(user_id: user)

    expect(dayform).to_not be_valid
  end

  it "is invalid without user" do
    recipes = build_list(:recipe, 4)
    day = create(:day, recipes: recipes)
    dayform = DayForm.new(date: day)
    
    expect(dayform).to_not be_valid
  end
end
