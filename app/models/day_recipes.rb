class DayRecipes < ApplicationRecord
  belongs_to :day
  belongs_to :recipe
end
