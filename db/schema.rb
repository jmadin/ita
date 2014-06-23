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

ActiveRecord::Schema.define(version: 20140623035717) do

  create_table "maps", force: true do |t|
    t.string   "map_name"
    t.text     "map_description"
    t.date     "map_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "map_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.decimal  "pixel_size"
  end

  create_table "outlines", force: true do |t|
    t.integer  "map_id"
    t.string   "substrate_type"
    t.string   "substrate_state"
    t.string   "outline_filename"
    t.string   "outliner_name"
    t.string   "outline_flag"
    t.decimal  "outline_area"
    t.decimal  "outline_perimeter"
    t.text     "outline_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "outlines", ["map_id"], name: "index_outlines_on_map_id"
  add_index "outlines", ["user_id"], name: "index_outlines_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
