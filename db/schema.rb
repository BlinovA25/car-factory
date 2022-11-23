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

ActiveRecord::Schema.define(version: 2022_11_19_091049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_pattern_units", force: :cascade do |t|
    t.bigint "car_pattern_id", null: false
    t.bigint "part_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_pattern_id"], name: "index_car_pattern_units_on_car_pattern_id"
    t.index ["part_id"], name: "index_car_pattern_units_on_part_id"
  end

  create_table "car_patterns", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "child"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "model"
    t.bigint "car_pattern_id", null: false
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_pattern_id"], name: "index_cars_on_car_pattern_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "serial_number"
    t.string "title"
    t.decimal "price"
    t.integer "child"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "car_pattern_units", "car_patterns"
  add_foreign_key "car_pattern_units", "parts"
  add_foreign_key "cars", "car_patterns"
end
