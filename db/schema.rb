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

ActiveRecord::Schema.define(version: 20171227012718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_banks", force: :cascade do |t|
    t.integer "agency_bank_id"
    t.integer "number_account"
    t.float "limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["agency_bank_id"], name: "index_account_banks_on_agency_bank_id"
    t.index ["deleted_at"], name: "index_account_banks_on_deleted_at"
  end

  create_table "agency_banks", force: :cascade do |t|
    t.integer "number_agency"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_agency_banks_on_deleted_at"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "account_bank_id"
    t.float "price"
    t.integer "transaction_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "destination_account_bank_id"
    t.boolean "cash_out", default: false
    t.index ["account_bank_id"], name: "index_transactions_on_account_bank_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
