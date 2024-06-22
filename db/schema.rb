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

ActiveRecord::Schema[7.0].define(version: 2024_06_22_134056) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "recipes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "timetable_id", null: false
    t.string "meal_type"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "ingredients"
    t.text "steps"
    t.string "meal_name"
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
    t.string "time_range_type"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "recipes", "timetables"
  add_foreign_key "recipes", "users"
  add_foreign_key "timetables", "users"
end
