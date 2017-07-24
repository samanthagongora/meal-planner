# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Recipes.destroy_all


user = User.create(username: "samantha", password: "password",role: 1)
user = User.create(username: "alex", password: "numbers",role: 1)
user = User.create(username: "lauren", password: "words",role: 0)
user = User.create(username: "rachel", password: "planets",role: 0)
user = User.create(username: "mike", password: "swords",role: 0)
user = User.create(username: "ali", password: "canary",role: 0)
user = User.create(username: "sal", password: "stroller",role: 0)

Recipe.create(name: "chicken", calories: 300, servings: 5)
Recipe.create(name: "beef", calories: 350, servings: 4)
Recipe.create(name: "pasta", calories: 500, servings: 8)
Recipe.create(name: "pork", calories: 400, servings: 9)
Recipe.create(name: "veggie", calories: 204, servings: 3)
Recipe.create(name: "pizza", calories: 678, servings: 4)
Recipe.create(name: "ramen", calories: 218, servings: 1)
Recipe.create(name: "burrito", calories: 300, servings: 6)
