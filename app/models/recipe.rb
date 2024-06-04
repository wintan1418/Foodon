class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :timetable

  # validates :meal_type, presence: true, inclusion: { in: %w[breakfast lunch dinner] }
  # validates :content, presence: true
  validates :ingredients, presence: true
  validates :steps, presence: true
end
