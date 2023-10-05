class ActivityRecord < ApplicationRecord
  belongs_to :user
  belongs_to :activity_image

  validates :act_date, presence: true
  validates :act_time, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 86_400 }
  validates :act_calories, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :act_distance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :comment, length: { maximum: 20 }

  def self.create_new_record(image, extracted_info, current_user)
    act_time = extracted_info[:min] * 60 + extracted_info[:sec]
    act_date = Date.today
    act_calories = extracted_info[:kcal]
    act_distance = extracted_info[:km]

    activity_record = ActivityRecord.new(
      act_date:,
      act_time:,
      act_calories:,
      act_distance:,
      user_id: current_user.id,
      activity_image_id: image.id
    )

    activity_record.save ? activity_record : nil
  end
end
