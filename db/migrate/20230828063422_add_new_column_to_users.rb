class AddNewColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :nickname, :string
    add_column :users, :avatar, :string
    add_column :users, :introduction, :text
    add_column :users, :twitter_url, :string
    add_column :users, :role, :integer, null: false, default: 0
  end
end
