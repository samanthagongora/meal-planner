class DayForm
  include ActiveModel::Model

  validates :date, presence: true
  validates :user_id, presence: true

  attr_accessor :date, :user_id, :breakfast_id, :lunch_id, :dinner_id, :snack_id

  def self.from_day(day)
    df = DayForm.new
    df.user_id = day.user.id
    df.date = day.date
    recipes = day.recipes
    df.breakfast_id = recipes[0].id
    df.lunch_id = recipes[1].id
    df.dinner_id = recipes[2].id
    df.snack_id = recipes[3].id
    df
  end

  def create(day)
    return false unless valid?
    user = User.find(user_id)
    breakfast = Recipe.find(breakfast_id)
    lunch = Recipe.find(lunch_id)
    dinner = Recipe.find(dinner_id)
    snack = Recipe.find(snack_id)
    day.user = user
    day.date = date
    day.recipes = [breakfast, lunch, dinner, snack]
    day.save
  end

  def update(day, day_form_params)
    return false unless valid?
    day.recipes.clear
    breakfast = Recipe.find(breakfast_id)
    lunch = Recipe.find(lunch_id)
    dinner = Recipe.find(dinner_id)
    snack = Recipe.find(snack_id)
    day.recipes = [breakfast, lunch, dinner, snack]
    day.save
  end
end
