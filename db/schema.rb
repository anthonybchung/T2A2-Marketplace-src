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

ActiveRecord::Schema[7.0].define(version: 2022_07_05_101839) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "year"
    t.integer "month"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "courses_enrollments", id: false, force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "enrollment_id"
  end

  create_table "enlistments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "excursion_id", null: false
    t.index ["excursion_id"], name: "index_enlistments_on_excursion_id"
    t.index ["user_id"], name: "index_enlistments_on_user_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "banned", default: false
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["user_id"], name: "index_enrollments_on_user_id"
  end

  create_table "excursions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "arrive_time"
    t.string "street_number"
    t.string "street_name"
    t.string "suburb"
    t.string "city"
    t.integer "state"
    t.integer "post_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id", null: false
    t.index ["course_id"], name: "index_excursions_on_course_id"
  end

  create_table "groups", force: :cascade do |t|
    t.text "description"
    t.integer "total_cost"
    t.integer "passenger_no"
    t.bigint "user_id", null: false
    t.bigint "excursion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "suburb"
    t.index ["excursion_id"], name: "index_groups_on_excursion_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "paid"
    t.index ["group_id"], name: "index_passengers_on_group_id"
    t.index ["user_id"], name: "index_passengers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "user_name"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "courses", "users"
  add_foreign_key "enlistments", "excursions"
  add_foreign_key "enlistments", "users"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "users"
  add_foreign_key "excursions", "courses"
  add_foreign_key "groups", "excursions"
  add_foreign_key "groups", "users"
  add_foreign_key "passengers", "groups"
  add_foreign_key "passengers", "users"
end
