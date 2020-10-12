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

ActiveRecord::Schema.define(version: 2020_07_29_085719) do

  create_table "days", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "day", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "department_name", null: false
    t.bigint "office_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_departments_on_office_id"
  end

  create_table "designations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "designation_name", null: false
    t.bigint "office_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_designations_on_office_id"
  end

  create_table "meal_settings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.time "last_input_time", null: false
    t.float "per_meal_price", null: false
    t.bigint "office_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_meal_settings_on_office_id"
  end

  create_table "meals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id_id"
    t.float "meal_count", null: false
    t.datetime "date", null: false
    t.bigint "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_meals_on_office_id"
    t.index ["user_id_id"], name: "index_meals_on_user_id_id"
  end

  create_table "off_days", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "day_id"
    t.bigint "office_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_off_days_on_day_id"
    t.index ["office_id"], name: "index_off_days_on_office_id"
  end

  create_table "office_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type_name", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "office_name", null: false
    t.text "office_address", null: false
    t.text "office_contact", null: false
    t.bigint "office_type_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_type_id"], name: "index_offices_on_office_type_id"
  end

  create_table "user_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "emp_id", null: false
    t.string "first_name", null: false
    t.string "last_name"
    t.date "dop", null: false
    t.integer "gender", null: false, comment: "1 => male, 2 => female, 3 => others"
    t.text "present_address", null: false
    t.text "permanent_address", null: false
    t.string "contact_no", null: false
    t.text "education", null: false
    t.date "joining_date", null: false
    t.bigint "office_id"
    t.bigint "user_id"
    t.bigint "designation_id"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_user_infos_on_department_id"
    t.index ["designation_id"], name: "index_user_infos_on_designation_id"
    t.index ["office_id"], name: "index_user_infos_on_office_id"
    t.index ["user_id"], name: "index_user_infos_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "user_name", null: false
    t.string "password", null: false
    t.string "plain_password", null: false
    t.boolean "is_admin", default: true
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "departments", "offices", on_delete: :cascade
  add_foreign_key "designations", "offices", on_delete: :cascade
  add_foreign_key "meal_settings", "offices", on_delete: :cascade
  add_foreign_key "meals", "offices", on_delete: :cascade
  add_foreign_key "off_days", "days", on_delete: :cascade
  add_foreign_key "off_days", "offices", on_delete: :cascade
  add_foreign_key "offices", "office_types", on_delete: :cascade
  add_foreign_key "user_infos", "departments", on_delete: :cascade
  add_foreign_key "user_infos", "designations", on_delete: :cascade
  add_foreign_key "user_infos", "offices", on_delete: :cascade
  add_foreign_key "user_infos", "users", on_delete: :cascade
end
