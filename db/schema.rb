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

ActiveRecord::Schema.define(version: 2022_10_30_023756) do

  create_table "addresses", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "name"
    t.integer "postal_code", null: false
    t.integer "prefectur", null: false
    t.string "address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "customer_id", null: false
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_cart_items_on_customer_id"
    t.index ["item_id"], name: "index_cart_items_on_item_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.integer "postal_code", null: false
    t.integer "prefectur", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.boolean "is_deleted", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "genre_id", null: false
    t.string "name"
    t.text "introduction"
    t.integer "price"
    t.boolean "is_active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_items_on_genre_id"
  end

  create_table "order_detils", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "item_id", null: false
    t.integer "price"
    t.integer "amount"
    t.integer "making_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_order_detils_on_item_id"
    t.index ["order_id"], name: "index_order_detils_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "postal_code", null: false
    t.string "prefectur", null: false
    t.string "address", null: false
    t.string "name"
    t.integer "shipping_cost"
    t.integer "total_payment"
    t.integer "payment_method"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  add_foreign_key "addresses", "customers"
  add_foreign_key "cart_items", "customers"
  add_foreign_key "cart_items", "items"
  add_foreign_key "items", "genres"
  add_foreign_key "order_detils", "items"
  add_foreign_key "order_detils", "orders"
  add_foreign_key "orders", "customers"
end
