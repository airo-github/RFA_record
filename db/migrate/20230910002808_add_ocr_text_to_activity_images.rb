class AddOcrTextToActivityImages < ActiveRecord::Migration[7.0]
  def change
    add_column :activity_images, :ocr_text, :text
  end
end
