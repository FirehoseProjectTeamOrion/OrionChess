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

ActiveRecord::Schema.define(version: 20160319223118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.integer  "white_player_id"
    t.integer  "black_player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "winning_player_id"
    t.boolean  "over"
    t.integer  "active_player_id"
  end

  add_index "games", ["active_player_id"], name: "index_games_on_active_player_id", using: :btree
  add_index "games", ["black_player_id"], name: "index_games_on_black_player_id", using: :btree
  add_index "games", ["white_player_id"], name: "index_games_on_white_player_id", using: :btree
  add_index "games", ["winning_player_id"], name: "index_games_on_winning_player_id", using: :btree

  create_table "pieces", force: true do |t|
    t.string   "type"
    t.integer  "row"
    t.integer  "column"
    t.boolean  "in_game",         default: true
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
    t.integer  "previous_row"
    t.integer  "previous_column"
    t.boolean  "last_to_move",    default: false
    t.integer  "user_id"
  end

  add_index "pieces", ["game_id"], name: "index_pieces_on_game_id", using: :btree
  add_index "pieces", ["user_id"], name: "index_pieces_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "wins",                   default: 0
    t.integer  "losses",                 default: 0
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
