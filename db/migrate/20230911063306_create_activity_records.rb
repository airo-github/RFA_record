class CreateActivityRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_records do |t|
      t.date :act_date, null: false
      t.time :act_time, null: false
      t.float :act_calories, null: false
      t.float :act_distance, null: false
      t.text  :comment
      t.boolean :visible, defalut: false

      t.timestamps
    end
  end
end
