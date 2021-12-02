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

ActiveRecord::Schema.define(version: 2021_12_02_132448) do

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "location_id"
    t.decimal "lon", precision: 9, scale: 6
    t.decimal "lat", precision: 9, scale: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "current_weathers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "weather_main"
    t.string "weather_description"
    t.string "weather_icon"
    t.integer "weather_id"
    t.float "temp"
    t.float "temp_max"
    t.float "temp_min"
    t.integer "humidity"
    t.integer "pressure"
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_current_weathers_on_city_id"
  end

  create_table "gardening_diaries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "work_name"
    t.datetime "implementation_date"
    t.text "work_content"
    t.string "plant_name"
    t.integer "plant_basic_datum_id"
    t.string "material_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "plant_individual_name"
    t.integer "material_consumption"
    t.index ["user_id"], name: "index_gardening_diaries_on_user_id"
  end

  create_table "material_stock_tables", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "material_name"
    t.integer "material_price"
    t.string "material_size"
    t.integer "material_quantity"
    t.datetime "material_purchase_date"
    t.string "material_purchase_location"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_material_stock_tables_on_user_id"
  end

  create_table "plant_basic_data", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "plant_name", null: false
    t.string "plant_breed_name"
    t.string "plant_family_name"
    t.string "plant_alias"
    t.string "plant_scientific_name"
    t.string "plant_place_of_origin"
    t.text "characteristics_applications"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_plant_basic_data_on_user_id"
  end

  create_table "plant_management_slips", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "plant_name"
    t.integer "plant_price"
    t.string "plant_size"
    t.string "plant_quantity"
    t.datetime "plant_purchase_date"
    t.string "plant_purchase_location"
    t.bigint "plant_basic_datum_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cultivation_place"
    t.string "plant_individual_name"
    t.index ["plant_basic_datum_id"], name: "index_plant_management_slips_on_plant_basic_datum_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "location_id", default: "1850147"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "current_weathers", "cities"
  add_foreign_key "gardening_diaries", "users"
  add_foreign_key "material_stock_tables", "users"
  add_foreign_key "plant_basic_data", "users"
  add_foreign_key "plant_management_slips", "plant_basic_data"
end
