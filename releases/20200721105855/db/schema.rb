# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_15_035657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.integer "manager_number", null: false
    t.string "hashed_password"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manager_number"], name: "index_administrators_on_manager_number", unique: true
  end

  create_table "app_users", force: :cascade do |t|
    t.string "email", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "nickname", null: false
    t.string "gender", null: false
    t.date "birthday", null: false
    t.string "prefecture", null: false
    t.string "target", null: false
    t.string "hashed_password"
    t.date "start_date"
    t.date "end_date"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "lower((email)::text)", name: "index_app_users_on_LOWER_email", unique: true
    t.index ["family_name_kana", "given_name_kana"], name: "index_app_users_on_family_name_kana_and_given_name_kana"
  end

  create_table "records", force: :cascade do |t|
    t.string "material"
    t.date "study_date"
    t.integer "study_hour"
    t.integer "study_minute"
    t.string "memo"
    t.bigint "app_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["app_user_id", "created_at"], name: "index_records_on_app_user_id_and_created_at"
    t.index ["created_at"], name: "index_records_on_created_at"
  end

  add_foreign_key "records", "app_users"
end
