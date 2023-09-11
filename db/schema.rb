# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_911_120_414) do
  create_table 'activity_images', force: :cascade do |t|
    t.string 'image', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id', null: false
    t.text 'ocr_text'
    t.index ['user_id'], name: 'index_activity_images_on_user_id'
  end

  create_table 'activity_records', force: :cascade do |t|
    t.date 'act_date', null: false
    t.time 'act_time', null: false
    t.float 'act_calories', null: false
    t.float 'act_distance', null: false
    t.text 'comment'
    t.boolean 'visible'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id', null: false
    t.index ['user_id'], name: 'index_activity_records_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'line_user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name', null: false
    t.string 'nickname'
    t.string 'avatar'
    t.text 'introduction'
    t.string 'twitter_url'
    t.integer 'role', default: 0, null: false
  end

  add_foreign_key 'activity_images', 'users'
  add_foreign_key 'activity_records', 'users'
end
