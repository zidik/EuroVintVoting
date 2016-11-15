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

ActiveRecord::Schema.define(version: 20161115161921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "participants", force: :cascade do |t|
    t.string   "country"
    t.string   "artist"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "voting_id"
    t.integer  "participant_id"
    t.integer  "order_no"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["participant_id"], name: "index_registrations_on_participant_id", using: :btree
    t.index ["voting_id", "participant_id"], name: "index_registrations_on_voting_id_and_participant_id", unique: true, using: :btree
    t.index ["voting_id"], name: "index_registrations_on_voting_id", using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "registration_id"
    t.string   "from_phone"
    t.string   "to_phone"
    t.string   "from_country"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "active"
    t.index ["registration_id"], name: "index_votes_on_registration_id", using: :btree
  end

  create_table "votings", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "running"
  end

  add_foreign_key "registrations", "participants"
  add_foreign_key "registrations", "votings"
  add_foreign_key "votes", "registrations"
end
