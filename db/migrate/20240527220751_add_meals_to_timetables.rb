class AddMealsToTimetables < ActiveRecord::Migration[7.0]
  def change
    add_column :timetables, :monday_breakfast, :text
    add_column :timetables, :monday_lunch, :text
    add_column :timetables, :monday_dinner, :text
    add_column :timetables, :tuesday_breakfast, :text
    add_column :timetables, :tuesday_lunch, :text
    add_column :timetables, :tuesday_dinner, :text
    add_column :timetables, :wednesday_breakfast, :text
    add_column :timetables, :wednesday_lunch, :text
    add_column :timetables, :wednesday_dinner, :text
    add_column :timetables, :thursday_breakfast, :text
    add_column :timetables, :thursday_lunch, :text
    add_column :timetables, :thursday_dinner, :text
    add_column :timetables, :friday_breakfast, :text
    add_column :timetables, :friday_lunch, :text
    add_column :timetables, :friday_dinner, :text
    add_column :timetables, :saturday_breakfast, :text
    add_column :timetables, :saturday_lunch, :text
    add_column :timetables, :saturday_dinner, :text
    add_column :timetables, :sunday_breakfast, :text
    add_column :timetables, :sunday_lunch, :text
    add_column :timetables, :sunday_dinner, :text
  end
end
