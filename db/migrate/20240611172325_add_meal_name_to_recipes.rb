class AddMealNameToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :meal_name, :string
  end
end
