class ActivityRecord < ApplicationRecord
  belongs_to :user
  belongs_to :activity_image

  validates :act_date, presence: true
  validates_date :act_date, on_or_before: -> { Date.current }
  validates :act_time, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 86_400 }
  validates :act_calories, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :act_distance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :comment, length: { maximum: 20 }
end
