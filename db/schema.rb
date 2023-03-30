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

ActiveRecord::Schema[7.0].define(version: 2023_03_29_021214) do
  create_table "furnishings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "chairs", default: 0, null: false
    t.integer "tables", default: 0, null: false
    t.integer "beds", default: 0, null: false
    t.integer "property_id", null: false
    t.index ["property_id"], name: "index_furnishings_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "description", null: false
    t.string "city", null: false
  end

  create_table "valuations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "EUR", null: false
    t.boolean "has_offer", default: false, null: false
    t.integer "property_id", null: false
    t.index ["property_id"], name: "index_valuations_on_property_id"
  end

  add_foreign_key "furnishings", "properties"
  add_foreign_key "valuations", "properties"
end
