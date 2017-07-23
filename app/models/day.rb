class Day < ApplicationRecord
  has_many :day_recipes, dependent: :destroy
  has_many :recipes, through: :day_recipes

  belongs_to :user

  validates :date, presence: true, uniqueness: true
  validates :user, presence: true
  validates :recipes, presence: true
  validate :recipe_length

  def recipe_length
    self.recipes == 4
  end
end
