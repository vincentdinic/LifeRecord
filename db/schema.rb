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

ActiveRecord::Schema[8.1].define(version: 2026_04_10_164401) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "due_date"
    t.bigint "family_id", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_accounts_on_family_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "documents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "document_type", null: false
    t.bigint "documentable_id", null: false
    t.string "documentable_type", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.bigint "uploaded_by_id", null: false
    t.index ["documentable_type", "documentable_id"], name: "index_documents_on_documentable"
    t.index ["uploaded_by_id"], name: "index_documents_on_uploaded_by_id"
  end

  create_table "education_records", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.boolean "current", default: false, null: false
    t.string "degree_type", null: false
    t.date "end_date"
    t.string "field_of_study"
    t.decimal "gpa", precision: 3, scale: 2
    t.string "school_name", null: false
    t.date "start_date", null: false
    t.string "state"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_education_records_on_user_id"
  end

  create_table "employment_records", force: :cascade do |t|
    t.string "city"
    t.string "company_name", null: false
    t.string "country"
    t.datetime "created_at", null: false
    t.boolean "current", default: false, null: false
    t.string "department"
    t.string "employment_status", null: false
    t.string "employment_type", null: false
    t.date "end_date"
    t.string "location_type", null: false
    t.string "pay_day"
    t.string "role", null: false
    t.decimal "salary", precision: 10, scale: 2
    t.string "salary_type"
    t.date "start_date", null: false
    t.string "state"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_employment_records_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.datetime "end_time", null: false
    t.bigint "family_id", null: false
    t.datetime "start_time", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_events_on_family_id"
  end

  create_table "families", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "join_code"
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["join_code"], name: "index_families_on_join_code", unique: true
  end

  create_table "family_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "family_id", null: false
    t.integer "role", default: 0, null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["family_id"], name: "index_family_users_on_family_id"
    t.index ["user_id", "family_id"], name: "index_family_users_on_user_id_and_family_id", unique: true
    t.index ["user_id"], name: "index_family_users_on_user_id"
  end

  create_table "maintenance_records", force: :cascade do |t|
    t.string "contractor"
    t.decimal "cost", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.bigint "created_by_id", null: false
    t.text "description"
    t.bigint "maintainable_id", null: false
    t.string "maintainable_type", null: false
    t.date "performed_on"
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_maintenance_records_on_created_by_id"
    t.index ["maintainable_type", "maintainable_id"], name: "index_maintenance_records_on_maintainable"
  end

  create_table "properties", force: :cascade do |t|
    t.decimal "bathrooms", precision: 3, scale: 1, null: false
    t.integer "bedrooms", null: false
    t.string "city", null: false
    t.string "country", default: "United States", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.bigint "family_id", null: false
    t.string "name", null: false
    t.integer "occupancy_status", default: 0, null: false
    t.integer "ownership_status", default: 0, null: false
    t.date "purchase_date"
    t.integer "square_feet"
    t.string "state", null: false
    t.string "street", null: false
    t.string "unit"
    t.datetime "updated_at", null: false
    t.integer "year_built"
    t.string "zip_code", null: false
    t.index ["family_id"], name: "index_properties_on_family_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "event_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.date "birthday", null: false
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "middle_name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.decimal "current_value", precision: 10, scale: 2
    t.bigint "family_id", null: false
    t.string "fuel_type"
    t.string "license_plate"
    t.string "make", null: false
    t.string "model", null: false
    t.string "nickname"
    t.date "purchase_date"
    t.decimal "purchase_price", precision: 10, scale: 2
    t.datetime "updated_at", null: false
    t.string "vehicle_type", null: false
    t.string "vin"
    t.integer "year"
    t.index ["family_id"], name: "index_vehicles_on_family_id"
  end

  add_foreign_key "accounts", "families"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "documents", "users", column: "uploaded_by_id"
  add_foreign_key "education_records", "users"
  add_foreign_key "employment_records", "users"
  add_foreign_key "events", "families"
  add_foreign_key "family_users", "families"
  add_foreign_key "family_users", "users"
  add_foreign_key "maintenance_records", "users", column: "created_by_id"
  add_foreign_key "properties", "families"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
  add_foreign_key "vehicles", "families"
end
