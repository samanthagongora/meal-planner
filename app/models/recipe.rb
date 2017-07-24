class Recipe < ApplicationRecord
  has_many :day_recipes
  has_many :days, through: :day_recipes

  validates :name, presence: true, uniqueness: true
  validates :calories, presence: true, numericality: true
  validates :servings, presence: true, numericality: true

  def calories_per_serving
    calories/servings
  end
end
