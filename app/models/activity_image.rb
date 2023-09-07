class ActivityImage < ApplicationRecord
  mount_uploader :image, ActivityImageUploader

  validates :image, presence: true
end
