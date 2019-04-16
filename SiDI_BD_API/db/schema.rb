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

ActiveRecord::Schema.define(version: 20161215171122) do

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

  create_table "student_records", force: :cascade do |t|
    t.string   "student_id",                  limit: 10
    t.string   "campus_id",                   limit: 3
    t.string   "period_id",                   limit: 6
    t.integer  "n_schedule_intents"
    t.boolean  "b_finished_time"
    t.boolean  "b_has_schedule"
    t.integer  "n_limited_units"
    t.integer  "n_selected_units"
    t.string   "division_id",                 limit: 2
    t.string   "career_id",                   limit: 6
    t.string   "level_id",                    limit: 2
    t.string   "student_type_id",             limit: 1
    t.string   "site_id",                     limit: 3
    t.string   "admission_id",                limit: 2
    t.integer  "n_semester"
    t.string   "major",                       limit: 4
    t.string   "minor",                       limit: 4
    t.string   "academic_status_id",          limit: 2
    t.boolean  "b_be_paa"
    t.string   "term_code_admit",             limit: 6
    t.string   "studies_max_grade",           limit: 3
    t.string   "session_id",                  limit: 1
    t.integer  "n_available_schedule_units"
    t.string   "centralization",              limit: 4
    t.string   "training_career_id",          limit: 6
    t.string   "minor_plan_id",               limit: 6
    t.string   "minor2_plan_id",              limit: 2
    t.boolean  "b_special_plan"
    t.boolean  "b_be_pti"
    t.integer  "n_max_units"
    t.datetime "max_units_modif_date"
    t.boolean  "b_be_scholarship_student"
    t.integer  "n_max_subjects"
    t.datetime "max_subjects_modif_date"
    t.integer  "n_overloaded_units"
    t.datetime "overloaded_units_modif_date"
    t.integer  "n_min_units_to_op"
    t.datetime "min_units_to_op_date"
    t.string   "toefl",                       limit: 10
    t.string   "admission_decision_code",     limit: 2
    t.integer  "b_revalidated"
    t.datetime "d_entrance_date"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "student_turns", force: :cascade do |t|
    t.string   "student_id",           limit: 10
    t.string   "period_id",            limit: 6
    t.string   "campus_id",            limit: 3
    t.datetime "d_remote_turn"
    t.datetime "d_e_preferences_date"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
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

  create_table "token_apps", force: :cascade do |t|
    t.datetime "expires_at"
    t.string   "token"
    t.string   "name_app"
    t.string   "cod_app"
    t.string   "request_allowed"
    t.boolean  "access"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
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
