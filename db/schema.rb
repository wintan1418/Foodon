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

ActiveRecord::Schema[7.0].define(version: 2024_05_29_155512) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "recipes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "timetable_id", null: false
    t.string "meal_type"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "ingredients"
    t.text "steps"
    t.index ["timetable_id"], name: "index_recipes_on_timetable_id"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "timetables", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date"
    t.text "breakfast"
    t.text "lunch"
    t.text "dinner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "monday_breakfast"
    t.text "monday_lunch"
    t.text "monday_dinner"
    t.text "tuesday_breakfast"
    t.text "tuesday_lunch"
    t.text "tuesday_dinner"
    t.text "wednesday_breakfast"
    t.text "wednesday_lunch"
    t.text "wednesday_dinner"
    t.text "thursday_breakfast"
    t.text "thursday_lunch"
    t.text "thursday_dinner"
    t.text "friday_breakfast"
    t.text "friday_lunch"
    t.text "friday_dinner"
    t.text "saturday_breakfast"
    t.text "saturday_lunch"
    t.text "saturday_dinner"
    t.text "sunday_breakfast"
    t.text "sunday_lunch"
    t.text "sunday_dinner"
    t.date "week_start_date"
    t.date "start_date"
    t.date "end_date"
    t.index ["user_id"], name: "index_timetables_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "recipes", "timetables"
  add_foreign_key "recipes", "users"
  add_foreign_key "timetables", "users"
end
