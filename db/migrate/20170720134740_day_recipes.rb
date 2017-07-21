class DayRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :day_recipes do |t|
      t.references :day
      t.references :recipe

      t.timestamps
    end
  end
end
