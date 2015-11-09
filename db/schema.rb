# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150130223851) do

  create_table "answers", force: true do |t|
    t.string "text"
  end

  create_table "clinical_trials", force: true do |t|
    t.integer  "clinician_id",            null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "duration",     limit: 8
    t.string   "name"
    t.string   "description"
    t.string   "IRB_ID",       limit: 64, null: false
  end

  create_table "form_instances", force: true do |t|
    t.integer  "patient_id",             null: false
    t.integer  "form_type_id",           null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "user_submission_time"
    t.datetime "actual_submission_time"
    t.boolean  "completed"
  end

  create_table "form_types", force: true do |t|
    t.string  "name"
    t.integer "interval"
  end

  create_table "item_types", force: true do |t|
    t.integer "form_type_id"
    t.integer "question_id"
    t.integer "question_order"
  end

  create_table "patients", force: true do |t|
    t.integer  "clinical_trial_id"
    t.string   "pin",               limit: 4, null: false
    t.string   "device_type"
    t.string   "version"
    t.datetime "date_started"
    t.datetime "date_completed"
  end

  create_table "question_answers", force: true do |t|
    t.integer "question_id"
    t.integer "answer_id"
  end

  create_table "questions", force: true do |t|
    t.string "text"
    t.string "qtype"
  end

  create_table "selected_answers", force: true do |t|
    t.integer "form_instance_id"
    t.integer "question_id"
    t.integer "answer_id"
  end

  create_table "trial_clinicians", force: true do |t|
    t.integer "user_id"
    t.integer "clinical_trial_id"
  end

  create_table "trial_forms", force: true do |t|
    t.integer "form_type_id"
    t.integer "clinical_trial_id"
    t.integer "delay"
    t.integer "duration"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
