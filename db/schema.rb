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

ActiveRecord::Schema.define(version: 20160109221839) do

  create_table "djs", force: :cascade do |t|
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "show_id",             limit: 4
    t.text     "bio",                 limit: 65535
    t.string   "password_digest",     limit: 255
    t.boolean  "is_admin"
    t.boolean  "is_default_password",               default: true
    t.string   "email",               limit: 255
  end

  add_index "djs", ["show_id"], name: "index_djs_on_show_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "artist",       limit: 255
    t.string   "link",         limit: 255
    t.string   "requested_by", limit: 255
    t.boolean  "acknowledged",             default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "shows", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.time     "start_time"
    t.time     "end_time"
    t.string   "day_of_week", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "artist",       limit: 255
    t.string   "requested_by", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "show_id",      limit: 4
  end

  add_index "songs", ["show_id"], name: "index_songs_on_show_id", using: :btree

end
