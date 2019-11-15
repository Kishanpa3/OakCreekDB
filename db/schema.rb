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

ActiveRecord::Schema.define(version: 2019_10_27_010232) do

  create_table "animals", force: :cascade do |t|
    t.integer "habitat_num"
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
    t.string "name"
    t.text "notes"
  end

  create_table "diets", force: :cascade do |t|
    t.text "instructions"
    t.text "am"
    t.text "pm"
    t.string "dish"
    t.integer "animal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_diets_on_animal_id"
  end

  create_table "documents", force: :cascade do |t|
    t.integer "animal_id"
    t.text "file_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_documents_on_animal_id"
  end

  add_foreign_key "diets", "animals"
  add_foreign_key "documents", "animals"
end
