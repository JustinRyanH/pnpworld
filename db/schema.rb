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

ActiveRecord::Schema[7.0].define(version: 2022_09_03_192623) do
  create_table "character_sheets", force: :cascade do |t|
    t.integer "keeper_id", null: false
    t.integer "character_id", null: false
    t.integer "level"
    t.json "data"
    t.integer "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_sheets_on_character_id"
    t.index ["keeper_id"], name: "index_character_sheets_on_keeper_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.integer "keeper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keeper_id"], name: "index_characters_on_keeper_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "google_uid"
    t.string "avatar_url"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "github_uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["google_uid"], name: "index_users_on_google_uid", unique: true
  end

  add_foreign_key "character_sheets", "characters"
  add_foreign_key "character_sheets", "users", column: "keeper_id"
  add_foreign_key "characters", "users", column: "keeper_id"
end
