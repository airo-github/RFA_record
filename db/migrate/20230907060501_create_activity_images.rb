class CreateActivityImages < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_images do |t|
      t.string :image, null: false

      t.timestamps
    end
  end
end
