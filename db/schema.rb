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

ActiveRecord::Schema.define(version: 2019_04_25_135447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "attended", default: false, null: false
    t.index ["course_id"], name: "index_attendances_on_course_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.datetime "schedule"
    t.string "location"
    t.integer "capacity"
    t.bigint "subject_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_courses_on_subject_id"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "mentee_id"
    t.bigint "mentor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: false, null: false
    t.index ["mentee_id"], name: "index_matches_on_mentee_id"
    t.index ["mentor_id"], name: "index_matches_on_mentor_id"
  end

  create_table "mentees", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "match_id"
    t.bigint "course_id"
    t.bigint "talk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_stories_on_course_id"
    t.index ["match_id"], name: "index_stories_on_match_id"
    t.index ["talk_id"], name: "index_stories_on_talk_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "schedule"
    t.string "location"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_talks_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.bigint "wish_id"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_tracks_on_subject_id"
    t.index ["wish_id"], name: "index_tracks_on_wish_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "hospital"
    t.string "phone"
    t.string "zipcode"
    t.bigint "mentor_id"
    t.bigint "mentee_id"
    t.integer "age"
    t.string "hobby_head"
    t.string "hobby_body"
    t.string "sickness"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["mentee_id"], name: "index_users_on_mentee_id"
    t.index ["mentor_id"], name: "index_users_on_mentor_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishes", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["user_id"], name: "index_wishes_on_user_id"
  end

  add_foreign_key "attendances", "courses"
  add_foreign_key "attendances", "users"
  add_foreign_key "courses", "subjects"
  add_foreign_key "courses", "teachers"
  add_foreign_key "matches", "mentees"
  add_foreign_key "matches", "mentors"
  add_foreign_key "stories", "courses"
  add_foreign_key "stories", "matches"
  add_foreign_key "stories", "talks"
  add_foreign_key "talks", "teachers"
  add_foreign_key "tracks", "subjects"
  add_foreign_key "tracks", "wishes"
  add_foreign_key "users", "mentees"
  add_foreign_key "users", "mentors"
  add_foreign_key "wishes", "users"
end
