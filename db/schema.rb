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

ActiveRecord::Schema.define(version: 20161114003031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "words", force: :cascade do |t|
    t.string   "word"
    t.string   "modern_definition"
    t.string   "shakespearean_definition"
    t.string   "modern_definition_url"
    t.string   "shakespearean_definition_url"
    t.integer  "word_count"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["word"], name: "index_words_on_word", using: :btree
  end

  create_table "words_works", force: :cascade do |t|
    t.integer  "word_id"
    t.integer  "work_id"
    t.integer  "word_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_id"], name: "index_words_works_on_word_id", using: :btree
    t.index ["work_id"], name: "index_words_works_on_work_id", using: :btree
  end

  create_table "works", force: :cascade do |t|
    t.string   "html"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
