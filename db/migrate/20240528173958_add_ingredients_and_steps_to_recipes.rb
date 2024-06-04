class AddIngredientsAndStepsToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :ingredients, :text
    add_column :recipes, :steps, :text
  end
end
