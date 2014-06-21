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

ActiveRecord::Schema.define(version: 20140621000713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "text_comment"
    t.integer  "post_id"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "topic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "soundcloud_user_id"
    t.string   "soundcloud_username"
    t.string   "soundcloud_access_token"
    t.string   "soundcloud_refresh_token"
    t.string   "soundcloud_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
  end

end
