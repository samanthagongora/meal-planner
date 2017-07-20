class DayRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :day_recipes do |t|
      t.references :days
      t.references :recipes

      t.timestamps
    end
  end
end
