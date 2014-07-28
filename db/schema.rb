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

ActiveRecord::Schema.define(version: 20140728025128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clefs", force: true do |t|
    t.string   "sign"
    t.integer  "line"
    t.integer  "measure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keys", force: true do |t|
    t.integer  "fifths"
    t.string   "mode"
    t.integer  "measure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measure_times", force: true do |t|
    t.integer  "beats"
    t.integer  "beat_type"
    t.integer  "measure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measures", force: true do |t|
    t.integer  "number"
    t.integer  "width"
    t.integer  "divisions"
    t.integer  "part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.boolean  "rest"
    t.integer  "duration"
    t.integer  "type"
    t.integer  "stem"
    t.boolean  "chord"
    t.integer  "measure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", force: true do |t|
    t.integer  "score_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "password_resets", force: true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "password_resets", ["user_id"], name: "index_password_resets_on_user_id", using: :btree

  create_table "pitches", force: true do |t|
    t.string   "step"
    t.integer  "alter"
    t.integer  "octave"
    t.integer  "note_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "composer"
    t.string   "music_xml"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "user_image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
