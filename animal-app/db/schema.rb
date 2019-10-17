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

ActiveRecord::Schema.define(version: 2019_10_17_155750) do

  create_table "animals", force: :cascade do |t|
    t.string "habitat_num"
    t.string "common_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "species"
    t.string "sex", limit: 6
    t.string "neutered", limit: 3
    t.integer "age"
    t.date "dob"
    t.float "weight"
    t.string "tag"
    t.string "enrichment"
    t.string "vaccination"
    t.integer "diet_id"
  end

  create_table "diets", force: :cascade do |t|
    t.string "dish"
    t.text "instructions"
    t.text "am"
    t.text "pm"
  end

  add_foreign_key "animals", "diets"
end
