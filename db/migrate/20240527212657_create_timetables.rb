class CreateTimetables < ActiveRecord::Migration[7.0]
  def change
    create_table :timetables do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.text :breakfast
      t.text :lunch
      t.text :dinner

      t.timestamps
    end
  end
end
