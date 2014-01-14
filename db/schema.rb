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

ActiveRecord::Schema.define(version: 20140114061316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channel_memberships", force: true do |t|
    t.integer "channel_id", null: false
    t.integer "user_id",    null: false
  end

  create_table "channels", force: true do |t|
    t.string   "name",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "users_count", default: 0
    t.string   "description"
    t.integer  "creator_id"
  end

  add_index "channels", ["name"], name: "index_channels_on_name", unique: true, using: :btree

  create_table "comments", force: true do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "follow_relationships", force: true do |t|
    t.integer  "follower_id", null: false
    t.integer  "followed_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follow_relationships", ["followed_id"], name: "index_follow_relationships_on_followed_id", using: :btree
  add_index "follow_relationships", ["follower_id", "followed_id"], name: "index_follow_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "follow_relationships", ["follower_id"], name: "index_follow_relationships_on_follower_id", using: :btree

  create_table "items", force: true do |t|
    t.integer  "post_id",    null: false
    t.string   "name",       null: false
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number",     null: false
    t.integer  "x",          null: false
    t.integer  "y",          null: false
  end

  add_index "items", ["post_id"], name: "index_items_on_post_id", using: :btree

  create_table "like_relationships", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "like_relationships", ["post_id"], name: "index_like_relationships_on_post_id", using: :btree
  add_index "like_relationships", ["user_id", "post_id"], name: "index_like_relationships_on_user_id_and_post_id", unique: true, using: :btree
  add_index "like_relationships", ["user_id"], name: "index_like_relationships_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "user_id",                              null: false
    t.string   "title",                                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cloudinary_id",                        null: false
    t.text     "description"
    t.integer  "like_relationships_count", default: 0
    t.integer  "comments_count",           default: 0
    t.integer  "tags_count",               default: 0
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "sites", force: true do |t|
    t.integer "user_id", null: false
    t.string  "name",    null: false
    t.string  "link",    null: false
  end

  add_index "sites", ["user_id"], name: "index_sites_on_user_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "post_id"
    t.datetime "created_at"
  end

  add_index "taggings", ["post_id"], name: "index_taggings_on_post_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name",                    null: false
    t.integer "posts_count", default: 0
  end

  create_table "users", force: true do |t|
    t.string   "email",                              null: false
    t.string   "encrypted_password",                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "description"
    t.string   "full_name",                          null: false
    t.string   "avatar_cloudinary_id"
    t.integer  "posts_count",            default: 0
    t.integer  "followings_count",       default: 0
    t.integer  "followers_count",        default: 0
    t.integer  "channels_count",         default: 0
    t.integer  "channel_allowance",      default: 1, null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
