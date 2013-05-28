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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130508190203) do

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id",   :default => 0
    t.string   "commentable_type", :default => ""
    t.string   "title",            :default => ""
    t.text     "body",             :default => ""
    t.string   "subject",          :default => ""
    t.integer  "project_id",       :default => 0,  :null => false
    t.integer  "user_id",          :default => 0,  :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "messages", :force => true do |t|
    t.string   "topic"
    t.text     "body"
    t.integer  "received_messageable_id"
    t.string   "received_messageable_type"
    t.integer  "sent_messageable_id"
    t.string   "sent_messageable_type"
    t.boolean  "opened",                     :default => false
    t.boolean  "recipient_delete",           :default => false
    t.boolean  "sender_delete",              :default => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "ancestry"
    t.boolean  "recipient_permanent_delete", :default => false
    t.boolean  "sender_permanent_delete",    :default => false
  end

  add_index "messages", ["ancestry"], :name => "index_messages_on_ancestry"
  add_index "messages", ["sent_messageable_id", "received_messageable_id"], :name => "acts_as_messageable_ids"

  create_table "projects", :force => true do |t|
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "title",                                  :null => false
    t.string   "category",                               :null => false
    t.string   "image",           :default => ""
    t.string   "video_url",       :default => ""
    t.string   "project_url",     :default => ""
    t.string   "looking_for",     :default => ""
    t.string   "current_members", :default => ""
    t.string   "status",          :default => "created"
  end

  add_index "projects", ["user_id", "created_at"], :name => "index_projects_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",            :default => false
    t.string   "skills_desc",      :default => ""
    t.string   "profile_pic_path", :default => ""
    t.string   "like_project_id",  :default => ""
    t.boolean  "mentor",           :default => false
    t.boolean  "seeking",          :default => false
    t.boolean  "joining",          :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
