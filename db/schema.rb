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

ActiveRecord::Schema[7.0].define(version: 2023_12_09_143526) do
  create_table "challenge_runs", force: :cascade do |t|
    t.integer "challenge_type_id"
    t.string "user_progress"
    t.integer "user_id"
    t.date "end_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenge_types", force: :cascade do |t|
    t.integer "duration"
    t.string "name"
    t.integer "profile_id"
    t.string "description"
    t.integer "challenge_runs_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "survey_id"
    t.integer "user_id"
    t.index ["user_id"], name: "index_challenge_types_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "description"
    t.integer "user_id"
    t.string "profile_name"
    t.integer "users_count"
    t.integer "challenge_types_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string "income"
    t.string "expenses"
    t.string "score"
    t.string "risk_tolerance"
    t.string "savings_goal"
    t.date "goal_target_date"
    t.string "savings_recommendation"
    t.string "investment_recommendation"
    t.integer "users_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.integer "survey_id"
    t.integer "profile_id"
    t.integer "challenge_runs_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
