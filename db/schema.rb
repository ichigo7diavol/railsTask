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

ActiveRecord::Schema.define(version: 20180610081357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

# Could not dump table "comp_logs" because of following StandardError
#   Unknown type 'manip_t' for column 'man_typ'

  create_table "control_reception_figures", primary_key: ["spec_id", "establishment_id"], force: :cascade do |t|
    t.integer "establishment_id", null: false
    t.integer "budget_position_count", null: false
    t.integer "commerc_position_count", null: false
    t.integer "spec_id", null: false
  end

  create_table "departments", primary_key: ["establishment_id", "department_id"], force: :cascade do |t|
    t.integer "establishment_id", null: false
    t.serial "department_id", null: false
    t.string "head_name", limit: 255
    t.string "head_second_name", limit: 255
    t.string "head_middle_name", limit: 255
  end

  create_table "establishment", primary_key: "establishment_id", id: :serial, force: :cascade do |t|
    t.string "address", limit: 20, null: false
    t.date "foundation_date", null: false
    t.string "accreditation_number", limit: 20
    t.date "accreditation_end_date"
    t.string "license_id", limit: 20
    t.string "establishment_name", limit: 20, null: false
    t.index ["license_id", "accreditation_number"], name: "xak2ó÷ðåæäåíèÿ", unique: true
  end

  create_table "groups", primary_key: ["establishment_id", "group_number"], force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "establishment_id", null: false
    t.integer "spec_id"
    t.integer "students_count", null: false
    t.string "group_number", limit: 8, null: false
  end

# Could not dump table "logs" because of following StandardError
#   Unknown type 'manip_t' for column 'man_typ'

  create_table "specialities", primary_key: "spec_id", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "study_duration", null: false
    t.string "spec_code", limit: 20
  end

  create_table "specialities_departments", primary_key: ["spec_id", "establishment_id", "department_id"], force: :cascade do |t|
    t.integer "spec_id", null: false
    t.integer "establishment_id", null: false
    t.integer "department_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "control_reception_figures", "establishment", primary_key: "establishment_id", name: "r_11"
  add_foreign_key "control_reception_figures", "specialities", column: "spec_id", primary_key: "spec_id", name: "r_30"
  add_foreign_key "departments", "establishment", primary_key: "establishment_id", name: "r_9"
  add_foreign_key "groups", "departments", column: "establishment_id", primary_key: "establishment_id", name: "r_28"
  add_foreign_key "groups", "specialities", column: "spec_id", primary_key: "spec_id", name: "r_33"
  add_foreign_key "specialities_departments", "departments", column: "establishment_id", primary_key: "establishment_id", name: "r_35"
  add_foreign_key "specialities_departments", "specialities", column: "spec_id", primary_key: "spec_id", name: "r_18"
end
