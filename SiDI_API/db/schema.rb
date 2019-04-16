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

ActiveRecord::Schema.define(version: 20161116190005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "c_type_emails", force: :cascade do |t|
    t.string   "type_email_id"
    t.string   "description"
    t.datetime "d_modified_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "periods", force: :cascade do |t|
    t.string   "period_id",                       limit: 6
    t.string   "campus_id",                       limit: 3
    t.boolean  "b_active_period"
    t.boolean  "b_sched_diff_periods"
    t.boolean  "b_check_sites"
    t.integer  "limited_session_time"
    t.string   "from_schedule_email",             limit: 100
    t.boolean  "b_check_priorities_1_2"
    t.boolean  "b_quota_exceeds_capacity"
    t.boolean  "b_send_email_finished_selection"
    t.text     "campus_contact_email"
    t.integer  "n_quota_less_limit"
    t.datetime "d_lim_new_schedule_date"
    t.string   "period_description",              limit: 30
    t.integer  "admission_no_nds_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "period_id"
    t.string   "campus_id"
    t.string   "user_id"
    t.string   "n_access"
    t.string   "user_type"
    t.string   "client_information"
    t.string   "ip_address"
    t.string   "app_server_ip_address"
    t.string   "app_server_port"
    t.datetime "d_last_sesion_date"
    t.datetime "d_modified_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "last_name"
    t.string   "mothers_last_name"
    t.string   "n_pidm"
    t.string   "photo"
    t.string   "sex"
    t.datetime "d_student_birthdate"
    t.datetime "d_generation_date"
    t.datetime "d_modified_date"
    t.datetime "d_entrance_date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "student_id"
  end

  create_table "token_students", force: :cascade do |t|
    t.datetime "expires_at"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
  end

  add_foreign_key "token_students", "students"
end
