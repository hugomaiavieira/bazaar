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

ActiveRecord::Schema.define(version: 20141014062724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
    t.text     "obs"
    t.string   "document"
  end

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "document"
    t.date     "birthday"
    t.text     "address"
    t.integer  "tax",                default: 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "obs"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "pieces", force: true do |t|
    t.integer  "category_id"
    t.integer  "brand_id"
    t.integer  "size_id"
    t.integer  "status",             default: 0
    t.date     "entry_date"
    t.date     "outbound_date"
    t.integer  "price"
    t.string   "code"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "pieces", ["brand_id"], name: "index_pieces_on_brand_id", using: :btree
  add_index "pieces", ["category_id"], name: "index_pieces_on_category_id", using: :btree
  add_index "pieces", ["member_id"], name: "index_pieces_on_member_id", using: :btree
  add_index "pieces", ["size_id"], name: "index_pieces_on_size_id", using: :btree

  create_table "sizes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
