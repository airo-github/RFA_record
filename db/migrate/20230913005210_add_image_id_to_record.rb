class AddImageIdToRecord < ActiveRecord::Migration[7.0]
  def change
    add_reference :activity_records, :activity_image, null: false, foreign_key: true
  end
end
