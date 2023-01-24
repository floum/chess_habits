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

ActiveRecord::Schema[7.0].define(version: 2023_01_24_101038) do
  create_table "analyses", force: :cascade do |t|
    t.string "best_move"
    t.integer "position_id", null: false
    t.float "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "depth"
    t.float "criticality"
    t.index ["position_id"], name: "index_analyses_on_position_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "pgn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lichess_id"
    t.boolean "reviewed"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "moves", force: :cascade do |t|
    t.integer "position_id", null: false
    t.string "move"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "puzzle_check"
    t.integer "game_id", null: false
    t.index ["game_id"], name: "index_moves_on_game_id"
    t.index ["position_id"], name: "index_moves_on_position_id"
  end

  create_table "position_labels", force: :cascade do |t|
    t.integer "position_id", null: false
    t.integer "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_position_labels_on_position_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "fen_board"
    t.string "fen_castling"
    t.string "en_passant"
    t.string "active_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "depth"
    t.float "score"
    t.string "best_move"
    t.float "criticality"
  end

  create_table "puzzles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "successes"
    t.integer "tries"
    t.integer "position_id", null: false
    t.index ["position_id"], name: "index_puzzles_on_position_id"
    t.index ["user_id"], name: "index_puzzles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "analyses", "positions"
  add_foreign_key "games", "users"
  add_foreign_key "moves", "games"
  add_foreign_key "moves", "positions"
  add_foreign_key "position_labels", "positions"
  add_foreign_key "puzzles", "positions"
  add_foreign_key "puzzles", "users"
end
