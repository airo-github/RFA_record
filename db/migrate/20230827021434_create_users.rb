class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string  :name, null: false
      t.string  :avatar
      t.text    :introduction
      t.string  :twitter_url
      t.string  :line_id, null: false, index: { unique: true }
      t.integer :role, null: false, default: 0
      t.timestamps
    end
  end
end
