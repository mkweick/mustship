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

ActiveRecord::Schema.define(version: 20151220203523) do

  create_table "mustship_totals", force: :cascade do |t|
    t.string "not_dispatched", default: "0", null: false
    t.string "not_picked",     default: "0", null: false
    t.string "not_verified",   default: "0", null: false
    t.string "verified",       default: "0", null: false
  end

  create_table "mustships", force: :cascade do |t|
    t.string "order_num"
    t.string "order_gen"
    t.string "carrier"
    t.string "dispatch_date"
    t.string "dispatch_time"
    t.string "buf_picker"
    t.string "buf_unit"
    t.string "ont_picker"
    t.string "ont_unit"
    t.string "account_name"
  end

end
