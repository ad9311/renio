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

ActiveRecord::Schema[8.0].define(version: 2025_01_18_165313) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.bigint "wallet_id", null: false
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "balance", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "month", null: false
    t.integer "year", null: false
    t.string "uid", null: false
    t.index ["uid"], name: "index_budgets_on_uid", unique: true
    t.index ["wallet_id"], name: "index_budgets_on_wallet_id"
  end

  create_table "expense_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.index ["name"], name: "index_expense_categories_on_name", unique: true
    t.index ["uid"], name: "index_expense_categories_on_uid", unique: true
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "expense_category_id", null: false
    t.bigint "budget_id", null: false
    t.string "description", default: "", null: false
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_expenses_on_budget_id"
    t.index ["expense_category_id"], name: "index_expenses_on_expense_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "budgets", "wallets"
  add_foreign_key "expenses", "budgets"
  add_foreign_key "expenses", "expense_categories"
  add_foreign_key "wallets", "users"
end
