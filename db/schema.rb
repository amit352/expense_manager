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

ActiveRecord::Schema[7.0].define(version: 2023_01_29_013204) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "transaction_modes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_parties", force: :cascade do |t|
    t.string "nominee"
    t.string "branch"
    t.string "account"
    t.boolean "third_party"
    t.decimal "balance", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "sub_category_id", null: false
    t.bigint "transaction_mode_id"
    t.bigint "issuer_id", null: false
    t.bigint "beneficiary_id", null: false
    t.decimal "amount", precision: 8, scale: 2, default: "0.0"
    t.integer "type"
    t.date "date"
    t.text "memo"
    t.string "receipts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beneficiary_id"], name: "index_transactions_on_beneficiary_id"
    t.index ["category_id"], name: "index_transactions_on_category_id"
    t.index ["issuer_id"], name: "index_transactions_on_issuer_id"
    t.index ["sub_category_id"], name: "index_transactions_on_sub_category_id"
    t.index ["transaction_mode_id"], name: "index_transactions_on_transaction_mode_id"
  end

  add_foreign_key "sub_categories", "categories"
  add_foreign_key "transactions", "categories"
  add_foreign_key "transactions", "sub_categories"
  add_foreign_key "transactions", "transaction_modes"
  add_foreign_key "transactions", "transaction_parties", column: "beneficiary_id"
  add_foreign_key "transactions", "transaction_parties", column: "issuer_id"
end
