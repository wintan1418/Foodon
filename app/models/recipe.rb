class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :timetable

  validates :meal_type, presence: true
  validates :meal_name, presence: true
  validates :ingredients, presence: true
  validates :steps, presence: true
end
