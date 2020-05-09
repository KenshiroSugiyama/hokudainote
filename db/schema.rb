# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_17_071513) do

  create_table "bank_accounts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bank_id"
    t.string "branch"
    t.string "account"
    t.string "kind"
    t.string "sex"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_bank_accounts_on_bank_id"
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "customer_id"
    t.string "card_id"
    t.integer "my_note_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["my_note_id"], name: "index_cards_on_my_note_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.integer "faculty_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_departments_on_faculty_id"
    t.index ["name"], name: "index_departments_on_name"
  end

  create_table "educators", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["last_name"], name: "index_educators_on_last_name"
  end

  create_table "educators_departments", force: :cascade do |t|
    t.integer "educator_id"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_educators_departments_on_department_id"
    t.index ["educator_id"], name: "index_educators_departments_on_educator_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_faculties_on_name"
  end

  create_table "images", force: :cascade do |t|
    t.integer "note_id"
    t.integer "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["note_id"], name: "index_images_on_note_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_lectures_on_name"
  end

  create_table "lectures_educators", force: :cascade do |t|
    t.integer "educator_id"
    t.integer "lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["educator_id", "lecture_id"], name: "index_lectures_educators_on_educator_id_and_lecture_id", unique: true
    t.index ["educator_id"], name: "index_lectures_educators_on_educator_id"
    t.index ["lecture_id"], name: "index_lectures_educators_on_lecture_id"
  end

  create_table "my_notes", force: :cascade do |t|
    t.integer "buyer_id"
    t.integer "note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_my_notes_on_buyer_id"
    t.index ["note_id"], name: "index_my_notes_on_note_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "user_id"
    t.text "description", limit: 1000
    t.bigint "price"
    t.string "grade", limit: 3
    t.string "year", limit: 45
    t.integer "exhibitor_id"
    t.integer "department_id"
    t.integer "lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "educator_id"
    t.index ["department_id"], name: "index_notes_on_department_id"
    t.index ["exhibitor_id"], name: "index_notes_on_exhibitor_id"
    t.index ["lecture_id"], name: "index_notes_on_lecture_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
    t.index ["year"], name: "index_notes_on_year"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "department_id"
    t.integer "school_year"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_user_profiles_on_department_id"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "@eis.hokudai.ac.jp", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
