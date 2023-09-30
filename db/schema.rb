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

ActiveRecord::Schema[7.0].define(version: 2023_09_30_015853) do
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

  create_table "b_materials", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "cost_code"
    t.float "unit_price"
    t.float "qty"
    t.string "uom"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_b_materials_on_location_id"
  end

  create_table "delivery_orders", force: :cascade do |t|
    t.string "delivery_status"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_delivery_orders_on_location_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.integer "qty"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_equipment_on_location_id"
  end

  create_table "import_materials", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.string "cost_code"
    t.float "unit_price"
    t.float "qty"
    t.string "uom"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_import_materials_on_location_id"
  end

  create_table "item_deliveries", force: :cascade do |t|
    t.string "status"
    t.string "qty"
    t.bigint "item_request_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_request_id"], name: "index_item_deliveries_on_item_request_id"
  end

  create_table "item_requests", force: :cascade do |t|
    t.string "item_type"
    t.bigint "item_id"
    t.bigint "request_id", null: false
    t.float "qty"
    t.string "eng_appr_status"
    t.string "man_appr_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "del_approv_status"
    t.bigint "delivery_order_id"
    t.index ["delivery_order_id"], name: "index_item_requests_on_delivery_order_id"
    t.index ["item_type", "item_id"], name: "index_item_requests_on_item"
    t.index ["request_id"], name: "index_item_requests_on_request_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "material_movements", force: :cascade do |t|
    t.float "unit_rate"
    t.float "qty"
    t.datetime "update_date"
    t.bigint "location_id", null: false
    t.bigint "material_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remarks"
    t.float "amount"
    t.index ["location_id"], name: "index_material_movements_on_location_id"
    t.index ["material_id"], name: "index_material_movements_on_material_id"
  end

  create_table "material_stockcounts", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.string "cost_code"
    t.float "unit_price"
    t.float "qty"
    t.string "uom"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_material_stockcounts_on_location_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.string "cost_code"
    t.float "unit_price"
    t.float "qty"
    t.string "uom"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "amount"
    t.datetime "update_date"
    t.index ["location_id"], name: "index_materials_on_location_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "user_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "original_location_id"
    t.index ["location_id"], name: "index_requests_on_location_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "stockcounts", force: :cascade do |t|
    t.datetime "update_date"
    t.float "qty"
    t.bigint "location_id", null: false
    t.bigint "material_id", null: false
    t.float "unit_rate"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "diff"
    t.index ["location_id"], name: "index_stockcounts_on_location_id"
    t.index ["material_id"], name: "index_stockcounts_on_material_id"
  end

  create_table "update_materials", force: :cascade do |t|
    t.float "unit_rate"
    t.datetime "update_date"
    t.bigint "location_id", null: false
    t.bigint "material_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "qty"
    t.float "amount"
    t.index ["location_id"], name: "index_update_materials_on_location_id"
    t.index ["material_id"], name: "index_update_materials_on_material_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "role"
    t.bigint "location_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["location_id"], name: "index_users_on_location_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "b_materials", "locations"
  add_foreign_key "delivery_orders", "locations"
  add_foreign_key "equipment", "locations"
  add_foreign_key "import_materials", "locations"
  add_foreign_key "item_deliveries", "item_requests"
  add_foreign_key "item_requests", "delivery_orders"
  add_foreign_key "item_requests", "requests"
  add_foreign_key "material_movements", "locations"
  add_foreign_key "material_movements", "materials"
  add_foreign_key "material_stockcounts", "locations"
  add_foreign_key "materials", "locations"
  add_foreign_key "requests", "locations"
  add_foreign_key "requests", "users"
  add_foreign_key "stockcounts", "locations"
  add_foreign_key "stockcounts", "materials"
  add_foreign_key "update_materials", "locations"
  add_foreign_key "update_materials", "materials"
  add_foreign_key "users", "locations"
end
