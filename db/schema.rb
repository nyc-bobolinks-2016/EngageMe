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

ActiveRecord::Schema.define(version: 20161103195130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "presentations", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "location",   null: false
    t.string   "audience",   null: false
    t.datetime "start_time", null: false
    t.datetime "end_time",   null: false
    t.string   "time_taken"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_presentations_on_user_id", using: :btree
  end

  create_table "results", force: :cascade do |t|
    t.decimal  "anger",           null: false
    t.decimal  "contempt",        null: false
    t.decimal  "disgust",         null: false
    t.decimal  "fear",            null: false
    t.decimal  "happiness",       null: false
    t.decimal  "neutral",         null: false
    t.decimal  "sadness",         null: false
    t.decimal  "surprise",        null: false
    t.integer  "presentation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["presentation_id"], name: "index_results_on_presentation_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest"
    t.string   "organization"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
