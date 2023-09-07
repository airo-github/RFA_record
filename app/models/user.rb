class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates :line_user_id, presence: true, uniqueness: true
  validates :nickname, length: { maximum: 10 }
  validates :introduction, length: { maximum: 50 }
end
