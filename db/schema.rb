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

ActiveRecord::Schema.define(version: 20140822102622) do

  create_table "news_topic_comments", force: true do |t|
    t.integer  "news_topic_id"
    t.text     "context"
    t.integer  "creator_id"
    t.string   "creator_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_topic_comments", ["creator_id"], name: "index_news_topic_comments_on_creator_id", using: :btree
  add_index "news_topic_comments", ["news_topic_id"], name: "index_news_topic_comments_on_news_topic_id", using: :btree

  create_table "news_topic_images", force: true do |t|
    t.integer  "news_topic_id"
    t.string   "original_file_name"
    t.string   "topic_image_file_name"
    t.string   "topic_image_content_type"
    t.integer  "topic_image_file_size"
    t.datetime "topic_image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_topic_images", ["news_topic_id"], name: "index_news_topic_images_on_news_topic_id", using: :btree

  create_table "news_topic_user_likes", force: true do |t|
    t.integer  "news_topic_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_topic_user_likes", ["news_topic_id"], name: "index_news_topic_user_likes_on_news_topic_id", using: :btree
  add_index "news_topic_user_likes", ["user_id"], name: "index_news_topic_user_likes_on_user_id", using: :btree

  create_table "news_topics", force: true do |t|
    t.string   "title"
    t.text     "context"
    t.text     "short_context"
    t.boolean  "top_news"
    t.integer  "comment_count", default: 0
    t.integer  "like_count",    default: 0
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_topics", ["creator_id"], name: "index_news_topics_on_creator_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "role",                   default: 1,  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role"], name: "index_users_on_role", using: :btree

end
