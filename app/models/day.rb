class Day < ApplicationRecord
  has_many :day_recipes, dependent: :destroy
  has_many :recipes, through: :day_recipes

  belongs_to :user

  validates :date, presence: true, uniqueness: true
end
