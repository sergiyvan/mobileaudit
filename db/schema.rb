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

ActiveRecord::Schema.define(version: 20140131183156) do

  create_table "payouts", force: true do |t|
    t.integer  "price"
    t.string   "status",     default: "open"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "payouts", ["user_id"], name: "index_payouts_on_user_id", using: :btree

  create_table "task_instances", force: true do |t|
    t.text     "content"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_id"
    t.integer  "user_id"
    t.text     "comment",        default: ""
    t.integer  "payout_id"
    t.datetime "taken_at"
    t.float    "agent_pos_lat"
    t.float    "agent_pos_long"
  end

  add_index "task_instances", ["payout_id"], name: "index_task_instances_on_payout_id", using: :btree

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "address"
    t.integer  "price"
    t.integer  "expirience"
    t.string   "status"
    t.string   "task_type"
    t.integer  "exp_require"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.float    "latitude"
    t.float    "longitude"
    t.date     "expdate"
    t.integer  "time_to_finish", default: 180
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "agent"
    t.string   "name"
    t.string   "lastname"
    t.string   "gender"
    t.string   "phone"
    t.date     "birthday"
    t.integer  "exp",                    default: 0
    t.integer  "credit",                 default: 0
    t.integer  "yandex"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
