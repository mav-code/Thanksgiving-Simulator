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

ActiveRecord::Schema.define(version: 2020_02_11_173821) do

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.integer "hunger"
    t.integer "tryptophan"
    t.string "politics"
  end

  create_table "plates", force: :cascade do |t|
    t.integer "person_id"
    t.integer "thanksgiving_id"
  end

  create_table "thanksgivings", force: :cascade do |t|
    t.string "type"
    t.integer "strife"
    t.string "location"
  end

end