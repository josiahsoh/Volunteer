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

ActiveRecord::Schema.define(version: 20160104040940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "date_type"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "num_of_volunteer"
    t.date     "dateline"
    t.string   "requirements"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "arts_and_culture",     default: false
    t.boolean  "sports",               default: false
    t.boolean  "animals",              default: false
    t.boolean  "technology",           default: false
    t.boolean  "education",            default: false
    t.boolean  "children_and_youth",   default: false
    t.boolean  "community",            default: false
    t.boolean  "environment",          default: false
    t.boolean  "homeless_and_housing", default: false
    t.boolean  "women",                default: false
    t.boolean  "seniors",              default: false
    t.boolean  "disaster_relief",      default: false
    t.boolean  "health",               default: false
    t.boolean  "immigrants_refugees",  default: false
    t.boolean  "special_events",       default: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "story_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["event_id"], name: "index_photos_on_event_id", using: :btree
  add_index "photos", ["story_id"], name: "index_photos_on_story_id", using: :btree

  create_table "stories", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "photos", "events"
  add_foreign_key "photos", "stories"
end
