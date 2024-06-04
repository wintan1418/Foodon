class AddStartDateAndEndDateToTimetables < ActiveRecord::Migration[7.0]
  def change
    add_column :timetables, :start_date, :date
    add_column :timetables, :end_date, :date
  end
end
