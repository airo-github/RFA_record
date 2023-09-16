class ActivityRecord < ApplicationRecord
  belongs_to :user
  belongs_to :activity_image
end
