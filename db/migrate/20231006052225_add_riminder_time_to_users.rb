class AddRiminderTimeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :reminder_time, :time
  end
end
