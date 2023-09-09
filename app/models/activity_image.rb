class ActivityImage < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ActivityImageUploader

  validates :image, presence: true
end
