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

ActiveRecord::Schema.define(version: 20151105211240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "comment"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["item_id"], name: "index_comments_on_item_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "pic_url"
    t.integer  "price"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "txns", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "buyer_id"
    t.integer  "item_id"
    t.integer  "seller_rating"
    t.integer  "buyer_rating"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "txns", ["item_id"], name: "index_txns_on_item_id", using: :btree
  add_index "txns", ["user_id"], name: "index_txns_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.string   "profilepic_url"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_reset_token"
  end

  add_foreign_key "comments", "items"
  add_foreign_key "items", "users"
  add_foreign_key "txns", "items"
  add_foreign_key "txns", "users"
end
