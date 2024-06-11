class Timetable < ApplicationRecord
  belongs_to :user
  has_many :recipes, dependent: :destroy
  accepts_nested_attributes_for :recipes, allow_destroy: true

  validates :time_range_type, presence: true
  validates :start_date, presence: true, if: :custom_or_week?
  validates :end_date, presence: true, if: :custom_or_week?

  def custom_or_week?
    time_range_type == 'custom' || time_range_type == 'week'
  end
end
