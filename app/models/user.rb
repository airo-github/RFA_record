class User < ApplicationRecord
  has_many :activity_images
  has_many :activity_records

  mount_uploader :avatar, AvatarUploader

  validates :line_user_id, presence: true, uniqueness: true
  validates :nickname, length: { maximum: 10 }
  validates :introduction, length: { maximum: 50 }

  # current_userか否かを判別するロジック
  def own?(object)
    object.user_id == id
  end
end
