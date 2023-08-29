class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates :line_user_id, presence: true, uniqueness: true
end
