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

ActiveRecord::Schema.define(version: 20160714150426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string   "name"
    t.integer  "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "abilities", ["resume_id"], name: "index_abilities_on_resume_id", using: :btree

  create_table "audiences", force: :cascade do |t|
    t.integer  "request_id"
    t.integer  "category_id"
    t.string   "subject"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "audiences", ["category_id"], name: "index_audiences_on_category_id", using: :btree
  add_index "audiences", ["request_id"], name: "index_audiences_on_request_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "data_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "colonies", force: :cascade do |t|
    t.string   "name"
    t.string   "postcode"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "colonies", ["city_id"], name: "index_colonies_on_city_id", using: :btree

  create_table "complaints", force: :cascade do |t|
    t.integer  "request_id"
    t.integer  "category_id"
    t.string   "subject"
    t.text     "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "complaints", ["category_id"], name: "index_complaints_on_category_id", using: :btree
  add_index "complaints", ["request_id"], name: "index_complaints_on_request_id", using: :btree

  create_table "contact_phones", force: :cascade do |t|
    t.integer  "contact_id"
    t.string   "tag"
    t.string   "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contact_phones", ["contact_id"], name: "index_contact_phones_on_contact_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "request_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "colony_id"
    t.string   "postcode"
    t.string   "street"
    t.string   "internal_number"
    t.string   "external_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "contacts", ["city_id"], name: "index_contacts_on_city_id", using: :btree
  add_index "contacts", ["colony_id"], name: "index_contacts_on_colony_id", using: :btree
  add_index "contacts", ["request_id"], name: "index_contacts_on_request_id", using: :btree
  add_index "contacts", ["state_id"], name: "index_contacts_on_state_id", using: :btree

  create_table "entries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "general_informations", force: :cascade do |t|
    t.integer  "request_id"
    t.integer  "title_id"
    t.string   "name"
    t.string   "father_last_name"
    t.string   "mother_last_name"
    t.date     "birthdate"
    t.integer  "gender_id"
    t.string   "email"
    t.string   "position"
    t.string   "organization"
    t.string   "ip"
    t.boolean  "anonymous"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "general_informations", ["gender_id"], name: "index_general_informations_on_gender_id", using: :btree
  add_index "general_informations", ["request_id"], name: "index_general_informations_on_request_id", using: :btree
  add_index "general_informations", ["title_id"], name: "index_general_informations_on_title_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.string   "percentage"
    t.integer  "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "languages", ["resume_id"], name: "index_languages_on_resume_id", using: :btree

  create_table "permission_roles", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "permission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "permission_roles", ["permission_id"], name: "index_permission_roles_on_permission_id", using: :btree
  add_index "permission_roles", ["role_id"], name: "index_permission_roles_on_role_id", using: :btree

  create_table "permissions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "action"
    t.string   "controller"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "request_id"
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id", using: :btree
  add_index "projects", ["request_id"], name: "index_projects_on_request_id", using: :btree

  create_table "request_files", force: :cascade do |t|
    t.integer  "request_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "request_files", ["request_id"], name: "index_request_files_on_request_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.string   "folio"
    t.date     "reception_date"
    t.integer  "data_type"
    t.integer  "user_id"
    t.integer  "entry_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "requests", ["entry_id"], name: "index_requests_on_entry_id", using: :btree
  add_index "requests", ["user_id"], name: "index_requests_on_user_id", using: :btree

  create_table "resumes", force: :cascade do |t|
    t.integer  "request_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "resumes", ["category_id"], name: "index_resumes_on_category_id", using: :btree
  add_index "resumes", ["request_id"], name: "index_resumes_on_request_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "key"
    t.text     "description"
    t.integer  "scope"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studies", force: :cascade do |t|
    t.string   "institution"
    t.string   "degree"
    t.date     "end_study"
    t.integer  "resume_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "studies", ["resume_id"], name: "index_studies_on_resume_id", using: :btree

  create_table "titles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mother_last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "role_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "abilities", "resumes"
  add_foreign_key "audiences", "categories"
  add_foreign_key "audiences", "requests"
  add_foreign_key "cities", "states"
  add_foreign_key "colonies", "cities"
  add_foreign_key "complaints", "categories"
  add_foreign_key "complaints", "requests"
  add_foreign_key "contact_phones", "contacts"
  add_foreign_key "contacts", "cities"
  add_foreign_key "contacts", "colonies"
  add_foreign_key "contacts", "requests"
  add_foreign_key "contacts", "states"
  add_foreign_key "general_informations", "genders"
  add_foreign_key "general_informations", "requests"
  add_foreign_key "general_informations", "titles"
  add_foreign_key "languages", "resumes"
  add_foreign_key "permission_roles", "permissions"
  add_foreign_key "permission_roles", "roles"
  add_foreign_key "projects", "categories"
  add_foreign_key "projects", "requests"
  add_foreign_key "request_files", "requests"
  add_foreign_key "requests", "entries"
  add_foreign_key "requests", "users"
  add_foreign_key "resumes", "categories"
  add_foreign_key "resumes", "requests"
  add_foreign_key "studies", "resumes"
  add_foreign_key "users", "roles"
end
