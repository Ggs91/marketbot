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

ActiveRecord::Schema.define(version: 2021_07_13_112816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "completion_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["completion_id"], name: "index_answers_on_completion_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "bots", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "questionnaire_id"
    t.bigint "bot_id"
    t.bigint "user_id"
    t.index ["bot_id"], name: "index_chatrooms_on_bot_id"
    t.index ["questionnaire_id"], name: "index_chatrooms_on_questionnaire_id"
    t.index ["user_id"], name: "index_chatrooms_on_user_id"
  end

  create_table "completions", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_completions_on_questionnaire_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chatroom_id"
    t.string "sender_type"
    t.bigint "sender_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["sender_type", "sender_id"], name: "index_messages_on_sender_type_and_sender_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.bigint "messages_id"
    t.string "name"
    t.integer "question_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["messages_id"], name: "index_questions_on_messages_id"
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "completions"
  add_foreign_key "answers", "questions"
  add_foreign_key "chatrooms", "bots"
  add_foreign_key "chatrooms", "questionnaires"
  add_foreign_key "chatrooms", "users"
  add_foreign_key "completions", "questionnaires"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "questions", "messages", column: "messages_id"
  add_foreign_key "questions", "questionnaires"
end
