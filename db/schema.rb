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

ActiveRecord::Schema.define(version: 20140121131615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "task_types", force: true do |t|
    t.string   "name"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",                    null: false
    t.text     "description",              null: false
    t.integer  "min_capacity", default: 1, null: false
    t.integer  "task_type_id",             null: false
    t.string   "skills",                                array: true
    t.datetime "deadline"
    t.text     "material"
    t.text     "handout"
    t.text     "deliverable"
    t.integer  "points",                   null: false
  end

end
