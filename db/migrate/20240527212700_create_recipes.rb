class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :timetable, null: false, foreign_key: true
      t.string :meal_type
      t.text :content

      t.timestamps
    end
  end
end
