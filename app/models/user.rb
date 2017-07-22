class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :days
  has_many :day_recipes, through: :days
  has_many :recipes, through: :day_recipes
end
