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

ActiveRecord::Schema.define(version: 2019_12_08_023602) do

  create_table "animal_profile_images", force: :cascade do |t|
    t.integer "animal_id", null: false
    t.integer "document_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_animal_profile_images_on_animal_id"
    t.index ["document_id"], name: "index_animal_profile_images_on_document_id"
  end

  create_table "animals", force: :cascade do |t|
    t.integer "habitat_num"
    t.string "common_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "species"
    t.string "sex", limit: 6
    t.string "neutered", limit: 3
    t.date "dob"
    t.float "weight"
    t.string "tag"
    t.string "name"
    t.text "notes"
    t.string "weight_units", limit: 3
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

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "approved", default: false, null: false
    t.boolean "admin", default: false, null: false
    t.boolean "can_view", default: true, null: false
    t.boolean "can_edit", default: false, null: false
    t.boolean "can_add", default: false, null: false
    t.boolean "can_delete", default: false, null: false
    t.index ["approved"], name: "index_users_on_approved"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "animal_profile_images", "animals"
  add_foreign_key "animal_profile_images", "documents"
  add_foreign_key "diets", "animals"
  add_foreign_key "documents", "animals"
end
