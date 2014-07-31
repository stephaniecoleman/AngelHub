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

ActiveRecord::Schema.define(version: 20140731031933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "developer_projects", force: true do |t|
    t.integer  "developer_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "developer_projects", ["developer_id"], name: "index_developer_projects_on_developer_id", using: :btree
  add_index "developer_projects", ["project_id"], name: "index_developer_projects_on_project_id", using: :btree

  create_table "developers", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "password"
    t.string   "image"
    t.string   "github_url"
    t.text     "blog_url",            default: [],              array: true
    t.string   "company"
    t.string   "location"
    t.text     "bio"
    t.boolean  "hireable"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "developers", ["email"], name: "index_developers_on_email", unique: true, using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar"
  end

  add_index "organizations", ["email"], name: "index_organizations_on_email", unique: true, using: :btree
  add_index "organizations", ["reset_password_token"], name: "index_organizations_on_reset_password_token", unique: true, using: :btree

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "repository"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.integer  "status",          default: 0
    t.string   "project_pic"
  end

  create_table "tagged_objects", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tagged_objects", ["tag_id"], name: "index_tagged_objects_on_tag_id", using: :btree
  add_index "tagged_objects", ["taggable_id"], name: "index_tagged_objects_on_taggable_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.integer  "tagged_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

end
