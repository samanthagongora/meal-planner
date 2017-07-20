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

ActiveRecord::Schema.define(version: 20170720164105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "day_recipes", force: :cascade do |t|
    t.bigint "days_id"
    t.bigint "recipes_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "meal"
    t.index ["days_id"], name: "index_day_recipes_on_days_id"
    t.index ["recipes_id"], name: "index_day_recipes_on_recipes_id"
  end

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_days_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.integer "servings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

end
