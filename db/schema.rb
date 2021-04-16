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

ActiveRecord::Schema.define(version: 2021_04_15_015843) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "bookmark_items", force: :cascade do |t|
    t.integer "bookmark_id"
    t.integer "workbook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "choose_quizzes", force: :cascade do |t|
    t.integer "workbook_item_id"
    t.text "quiz"
    t.integer "judge"
    t.text "explanation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memos", force: :cascade do |t|
    t.integer "workbook_item_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.text "introduction"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "word_quiz_items", force: :cascade do |t|
    t.integer "word_quiz_id"
    t.text "correct_word"
    t.text "explanation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "word_quizzes", force: :cascade do |t|
    t.integer "workbook_item_id"
    t.text "quiz"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workbook_items", force: :cascade do |t|
    t.integer "workbook_id"
    t.integer "quiz_type"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workbooks", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "disclosure_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "writing_quizzes", force: :cascade do |t|
    t.integer "workbook_item_id"
    t.text "quiz"
    t.text "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
