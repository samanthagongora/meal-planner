class Day < ApplicationRecord
  has_many :day_recipes
  has_many :recipes, through: :day_recipes

  belongs_to :user
end
