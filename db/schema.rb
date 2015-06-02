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

ActiveRecord::Schema.define(version: 20150602060941) do

  create_table "locations", force: :cascade do |t|
    t.string   "location_name"
    t.string   "location_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.text     "location_notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "maps", force: :cascade do |t|
    t.string   "map_name",        limit: 255
    t.text     "map_description"
    t.date     "map_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "map_code",        limit: 255
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.decimal  "pixel_size"
    t.integer  "trip_id"
    t.integer  "location_id"
  end

  add_index "maps", ["location_id"], name: "index_maps_on_location_id"
  add_index "maps", ["trip_id"], name: "index_maps_on_trip_id"

  create_table "outlines", force: :cascade do |t|
    t.integer  "map_id"
    t.string   "substrate_type",    limit: 255
    t.string   "substrate_state",   limit: 255
    t.string   "outline_filename",  limit: 255
    t.string   "outliner_name",     limit: 255
    t.string   "outline_flag",      limit: 255
    t.decimal  "outline_area"
    t.decimal  "outline_perimeter"
    t.text     "outline_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "outlines", ["map_id"], name: "index_outlines_on_map_id"
  add_index "outlines", ["user_id"], name: "index_outlines_on_user_id"

  create_table "trips", force: :cascade do |t|
    t.string   "trip_name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "trip_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips_users", id: false, force: :cascade do |t|
    t.integer "trip_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", limit: 255
    t.string   "remember_token",  limit: 255
    t.boolean  "admin"
    t.string   "surname"
    t.string   "institution"
    t.datetime "last_seen_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
