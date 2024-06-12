class AddTimeRangeTypeToTimetables < ActiveRecord::Migration[7.0]
  def change
    add_column :timetables, :time_range_type, :string
  end
end
