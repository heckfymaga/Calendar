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

ActiveRecord::Schema.define(version: 20171207172707) do

  create_table "active_tasks", force: :cascade do |t|
    t.integer  "task_id"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "active_tasks", ["task_id", "date"], name: "active_tasks_task_id_date_uindex", unique: true
  add_index "active_tasks", ["task_id"], name: "index_active_tasks_on_task_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["name"], name: "categories_name_uindex", unique: true

  create_table "category_users", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_users", ["category_id"], name: "index_category_users_on_category_id"
  add_index "category_users", ["user_id"], name: "index_category_users_on_user_id"

  create_table "task_frequencies", force: :cascade do |t|
    t.string   "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "task_frequencies", ["frequency"], name: "task_frequencies_frequency_uindex", unique: true

  create_table "tasks", force: :cascade do |t|
    t.string   "target"
    t.date     "date"
    t.integer  "frequency_id", default: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
    t.integer  "category_id"
  end

  add_index "tasks", ["category_id"], name: "index_tasks_on_category_id"
  add_index "tasks", ["frequency_id"], name: "index_tasks_on_frequency_id"
  add_index "tasks", ["user_id", "id"], name: "tasks_user_id_id_uindex", unique: true
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
