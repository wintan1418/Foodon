class AddPublicToTimetables < ActiveRecord::Migration[7.0]
  def change
    add_column :timetables, :public, :boolean
  end
end
