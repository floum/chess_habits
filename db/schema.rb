# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_16_234544) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "pgn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lichess_id"
    t.boolean "reviewed"
  end

  create_table "moves", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "position_id", null: false
    t.string "move"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_moves_on_position_id"
    t.index ["user_id"], name: "index_moves_on_user_id"
  end

  create_table "openings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "position_labels", force: :cascade do |t|
    t.bigint "position_id", null: false
    t.integer "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_position_labels_on_position_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "fen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "depth"
    t.float "score"
    t.string "best_move"
    t.float "criticality"
  end

  create_table "puzzles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "successes"
    t.integer "tries"
    t.bigint "position_id", null: false
    t.index ["position_id"], name: "index_puzzles_on_position_id"
    t.index ["user_id"], name: "index_puzzles_on_user_id"
  end

  create_table "repertoire_moves", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "position_id", null: false
    t.string "move"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tries"
    t.integer "successes"
    t.index ["position_id"], name: "index_repertoire_moves_on_position_id"
    t.index ["user_id"], name: "index_repertoire_moves_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "moves", "positions"
  add_foreign_key "moves", "users"
  add_foreign_key "position_labels", "positions"
  add_foreign_key "puzzles", "positions"
  add_foreign_key "puzzles", "users"
  add_foreign_key "repertoire_moves", "positions"
  add_foreign_key "repertoire_moves", "users"
end
