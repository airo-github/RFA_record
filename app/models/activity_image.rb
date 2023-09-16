class ActivityImage < ApplicationRecord
  belongs_to :user
  has_one :activity_record
  mount_uploader :image, ActivityImageUploader

  validates :image, presence: true
end
