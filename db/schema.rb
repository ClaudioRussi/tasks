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

ActiveRecord::Schema.define(version: 20161120052436) do

  create_table "collaborator_projects", id: false, force: :cascade do |t|
    t.integer "collaborator_id", null: false
    t.integer "project_id",      null: false
    t.index ["collaborator_id"], name: "index_collaborator_projects_on_collaborator_id"
    t.index ["project_id"], name: "index_collaborator_projects_on_project_id"
  end

  create_table "connection_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "connection_id"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["connection_id"], name: "index_connection_requests_on_connection_id"
    t.index ["user_id"], name: "index_connection_requests_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_groups_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "author_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["author_id"], name: "index_projects_on_author_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "status",      default: "Pending"
    t.integer  "group_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["group_id"], name: "index_tasks_on_group_id"
  end

  create_table "tasks_workers", id: false, force: :cascade do |t|
    t.integer "task_id",   null: false
    t.integer "worker_id", null: false
    t.index ["task_id"], name: "index_tasks_workers_on_task_id"
    t.index ["worker_id"], name: "index_tasks_workers_on_worker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
