class AddUserIdToActivityImages < ActiveRecord::Migration[7.0]
  def change
    add_reference :activity_images, :user, null: false, foreign_key: true
  end
end
