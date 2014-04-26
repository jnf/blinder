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

ActiveRecord::Schema.define(version: 20140426140043) do

  create_table "blinds", force: true do |t|
    t.integer  "level"
    t.integer  "event_id"
    t.string   "title"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.integer  "blind_level"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "human_key",     default: "I am a human."
    t.boolean  "active",        default: false
    t.datetime "expires_at"
    t.text     "inactive_info", default: ""
  end

  create_table "notes", force: true do |t|
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposals", force: true do |t|
    t.integer  "event_id"
    t.text     "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "safe_for_review", default: false
  end

  add_index "proposals", ["slug"], name: "index_proposals_on_slug"

  create_table "questions", force: true do |t|
    t.integer  "blind_id"
    t.string   "label"
    t.string   "kind"
    t.text     "values"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.boolean  "required",   default: true
    t.text     "group"
    t.boolean  "sortable",   default: false
  end

  create_table "responses", force: true do |t|
    t.integer  "proposal_id"
    t.integer  "question_id"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scrubs", force: true do |t|
    t.integer  "response_id"
    t.integer  "blind_level"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

end
