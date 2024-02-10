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

ActiveRecord::Schema[7.1].define(version: 2024_02_10_035918) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "account_active_session_keys", primary_key: ["account_id", "session_id"], force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "session_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "last_use", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["account_id"], name: "index_account_active_session_keys_on_account_id"
  end

  create_table "account_login_change_keys", force: :cascade do |t|
    t.string "key", null: false
    t.string "login", null: false
    t.datetime "deadline", null: false
  end

  create_table "account_otp_keys", force: :cascade do |t|
    t.string "key", null: false
    t.integer "num_failures", default: 0, null: false
    t.datetime "last_use", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "account_password_reset_keys", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "deadline", null: false
    t.datetime "email_last_sent", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "account_recovery_codes", primary_key: ["id", "code"], force: :cascade do |t|
    t.bigint "id", null: false
    t.string "code", null: false
  end

  create_table "account_remember_keys", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "deadline", null: false
  end

  create_table "account_sms_codes", force: :cascade do |t|
    t.string "phone_number", null: false
    t.integer "num_failures"
    t.string "code"
    t.datetime "code_issued_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "account_verification_keys", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "requested_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "email_last_sent", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.integer "status", default: 1, null: false
    t.citext "email", null: false
    t.string "password_hash"
    t.index ["email"], name: "index_accounts_on_email", unique: true, where: "(status = ANY (ARRAY[1, 2]))"
  end

  create_table "daily_goals", force: :cascade do |t|
    t.integer "calorie_goal"
    t.integer "protein_goal"
    t.integer "fat_goal"
    t.integer "carbs_goal"
    t.integer "sugar_goal"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date", default: -> { "CURRENT_DATE" }, null: false
    t.index ["account_id"], name: "index_daily_goals_on_account_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.decimal "calories"
    t.decimal "protein"
    t.decimal "fat"
    t.decimal "carbs"
    t.decimal "sugar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_ingredients", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "ingredient_id", null: false
    t.decimal "quantity"
    t.bigint "unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_meal_ingredients_on_ingredient_id"
    t.index ["meal_id"], name: "index_meal_ingredients_on_meal_id"
    t.index ["unit_id"], name: "index_meal_ingredients_on_unit_id"
  end

  create_table "meals", force: :cascade do |t|
    t.integer "name"
    t.datetime "meal_date"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_meals_on_account_id"
  end

  create_table "units", force: :cascade do |t|
    t.integer "unit_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "account_active_session_keys", "accounts"
  add_foreign_key "account_login_change_keys", "accounts", column: "id"
  add_foreign_key "account_otp_keys", "accounts", column: "id"
  add_foreign_key "account_password_reset_keys", "accounts", column: "id"
  add_foreign_key "account_recovery_codes", "accounts", column: "id"
  add_foreign_key "account_remember_keys", "accounts", column: "id"
  add_foreign_key "account_sms_codes", "accounts", column: "id"
  add_foreign_key "account_verification_keys", "accounts", column: "id"
  add_foreign_key "daily_goals", "accounts"
  add_foreign_key "meal_ingredients", "ingredients"
  add_foreign_key "meal_ingredients", "meals"
  add_foreign_key "meal_ingredients", "units"
  add_foreign_key "meals", "accounts"
end
