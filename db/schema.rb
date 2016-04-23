# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160422232113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_transactions", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "user_id"
    t.string   "purpose"
    t.float    "value"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "account_transactions", ["account_id"], name: "index_account_transactions_on_account_id", using: :btree
  add_index "account_transactions", ["category_id"], name: "index_account_transactions_on_category_id", using: :btree
  add_index "account_transactions", ["user_id"], name: "index_account_transactions_on_user_id", using: :btree

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.float    "value"
    t.float    "critical_value"
    t.boolean  "notification"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devise_logs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "devise_logs", ["user_id"], name: "index_devise_logs_on_user_id", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lname"
    t.string   "fname"
    t.string   "username"
    t.string   "unique_session_id",      limit: 20
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "account_transactions", "accounts"
  add_foreign_key "account_transactions", "categories"
  add_foreign_key "account_transactions", "users"
  add_foreign_key "devise_logs", "users"
  add_foreign_key "identities", "users"
end
