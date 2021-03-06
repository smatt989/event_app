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

ActiveRecord::Schema.define(version: 20141110043733) do

  create_table "event_shares", force: true do |t|
    t.integer  "event_id"
    t.integer  "sharer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_shares", ["event_id", "sharer_id"], name: "index_event_shares_on_event_id_and_sharer_id", unique: true
  add_index "event_shares", ["event_id"], name: "index_event_shares_on_event_id"
  add_index "event_shares", ["sharer_id"], name: "index_event_shares_on_sharer_id"

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.datetime "startTime"
    t.datetime "endTime"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "picture"
  end

  add_index "events", ["user_id", "created_at"], name: "index_events_on_user_id_and_created_at"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "following_relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "following_relationships", ["followed_id"], name: "index_following_relationships_on_followed_id"
  add_index "following_relationships", ["follower_id", "followed_id"], name: "index_following_relationships_on_follower_id_and_followed_id", unique: true
  add_index "following_relationships", ["follower_id"], name: "index_following_relationships_on_follower_id"

  create_table "users", force: true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

end
