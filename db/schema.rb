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

ActiveRecord::Schema.define(version: 2021_08_26_124804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bussinesses", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "zipcode"
    t.string "neighborhood"
    t.integer "interested"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "facebook"
    t.string "instagram"
    t.string "site_web"
    t.boolean "chatbot"
    t.boolean "system_price"
    t.boolean "newsletter"
    t.boolean "trans_site"
    t.boolean "delivery"
    t.string "email"
    t.text "comments"
    t.integer "team_id"
    t.string "phone"
    t.integer "office"
    t.index ["team_id"], name: "index_bussinesses_on_team_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.integer "sign_in_count", default: 0, null: false
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "role_id"
    t.integer "team_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "users", "teams"
end
