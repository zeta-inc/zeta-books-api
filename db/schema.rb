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

ActiveRecord::Schema.define(version: 20150514163243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "author_name"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "authors", ["user_id"], name: "index_authors_on_user_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.json     "metadata"
    t.json     "parts_ids"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "first_part_id"
  end

  add_index "documents", ["author_id"], name: "index_documents_on_author_id", using: :btree
  add_index "documents", ["first_part_id"], name: "index_documents_on_first_part_id", using: :btree

  create_table "parts", force: :cascade do |t|
    t.string   "name"
    t.json     "metadata"
    t.text     "content"
    t.integer  "next_id"
    t.integer  "previous_id"
    t.integer  "document_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "parts", ["document_id"], name: "index_parts_on_document_id", using: :btree
  add_index "parts", ["previous_id"], name: "index_parts_on_previous_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "authors", "users"
  add_foreign_key "documents", "authors"
  add_foreign_key "parts", "documents"
end
