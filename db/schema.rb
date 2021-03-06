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

ActiveRecord::Schema.define(:version => 20120312203301) do

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "room"
    t.datetime "time_from"
    t.datetime "time_to"
    t.boolean  "isAStation"
    t.text     "short_description"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "guide_id"
    t.integer  "visitor_id"
    t.boolean  "is_in_group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "usertype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
    t.string   "password_salt"
  end

  create_table "visitors", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile"
    t.text     "interests"
    t.integer  "number_of_stars"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
