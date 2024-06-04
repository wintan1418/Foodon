class AddWeekStartDateToTimetables < ActiveRecord::Migration[7.0]
  def change
    add_column :timetables, :week_start_date, :date
  end
end
