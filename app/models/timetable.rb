class Timetable < ApplicationRecord
  belongs_to :user
  has_many :recipes, dependent: :destroy

  accepts_nested_attributes_for :recipes, allow_destroy: true

  validates :week_start_date, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :monday_breakfast, :monday_lunch, :monday_dinner, presence: true
  validates :tuesday_breakfast, :tuesday_lunch, :tuesday_dinner, presence: true
  validates :wednesday_breakfast, :wednesday_lunch, :wednesday_dinner, presence: true
  validates :thursday_breakfast, :thursday_lunch, :thursday_dinner, presence: true
  validates :friday_breakfast, :friday_lunch, :friday_dinner, presence: true
  validates :saturday_breakfast, :saturday_lunch, :saturday_dinner, presence: true
  validates :sunday_breakfast, :sunday_lunch, :sunday_dinner, presence: true

  def start_date
    week_start_date
  end

  # Define methods to access recipes for specific meals
  %w[monday tuesday wednesday thursday friday saturday sunday].each do |day|
    define_method("#{day}_breakfast_recipe") do
      recipes.find_by(meal_type: "#{day}_breakfast")
    end
    define_method("#{day}_lunch_recipe") do
      recipes.find_by(meal_type: "#{day}_lunch")
    end
    define_method("#{day}_dinner_recipe") do
      recipes.find_by(meal_type: "#{day}_dinner")
    end
  end
end
