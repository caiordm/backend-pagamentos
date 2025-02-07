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

ActiveRecord::Schema[7.1].define(version: 2024_06_15_184537) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "transfers", force: :cascade do |t|
    t.bigint "payee_id", null: false
    t.bigint "payer_id", null: false
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payee_id"], name: "index_transfers_on_payee_id"
    t.index ["payer_id"], name: "index_transfers_on_payer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome_completo"
    t.string "cpfcnpj", limit: 40
    t.string "email"
    t.string "senha"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpfcnpj"], name: "index_users_on_cpfcnpj", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "saldo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "transfers", "users", column: "payee_id"
  add_foreign_key "transfers", "users", column: "payer_id"
  add_foreign_key "wallets", "users"
end
