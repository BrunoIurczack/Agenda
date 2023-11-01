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

ActiveRecord::Schema[7.0].define(version: 2023_08_10_173954) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "balance_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price_cents"
    t.bigint "company_id", null: false
    t.bigint "category_id", null: false
    t.bigint "brand_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "company_id", null: false
    t.integer "amount_cents"
    t.integer "product_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_sales_on_company_id"
    t.index ["product_id"], name: "index_sales_on_product_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.integer "amount_cents"
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_transfers_on_company_id"
    t.index ["user_id"], name: "index_transfers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.integer "balance_cents"
    t.integer "lock_version", default: 0
  end

  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "companies"
  add_foreign_key "sales", "companies"
  add_foreign_key "sales", "products"
  add_foreign_key "transfers", "companies"
  add_foreign_key "transfers", "users"
end
