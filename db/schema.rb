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

ActiveRecord::Schema.define(version: 20161207031851) do

  create_table "homilies", force: :cascade do |t|
    t.date     "date"
    t.string   "subject"
    t.string   "week"
    t.string   "time"
    t.string   "cycle"
    t.string   "first_reading_book"
    t.string   "first_reading_chapter"
    t.string   "first_reading_verse"
    t.string   "second_reading_book"
    t.string   "second_reading_chapter"
    t.string   "second_reading_verse"
    t.string   "gospel_book"
    t.string   "gospel_chapter"
    t.string   "gospel_verse"
    t.text     "homily_text"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["user_id"], name: "index_homilies_on_user_id"
  end

  create_table "infos", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.date     "date_of_birth"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "phone"
    t.string   "cell_phone"
    t.string   "wife_name"
    t.string   "wife_date_of_birth"
    t.string   "wedding_anniversary"
    t.string   "diocese_of_ordination"
    t.date     "ordination_date"
    t.string   "diocese_of_incardination"
    t.date     "incardination_date"
    t.boolean  "military_service"
    t.boolean  "faculties"
    t.boolean  "preaching"
    t.string   "status"
    t.string   "employer"
    t.string   "employer_address"
    t.string   "secondary_address"
    t.string   "secondary_city"
    t.string   "string"
    t.string   "secondary_state"
    t.string   "secondary_zip"
    t.string   "secondary_phone"
    t.string   "assignment"
    t.string   "assignment_location"
    t.string   "assignment_pastor"
    t.string   "emergency_contact_name"
    t.string   "emergency_contract_phone"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_infos_on_user_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
    t.string   "activation_digest"
    t.boolean  "activated",                    default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "date_of_birth"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "phone"
    t.string   "cell_phone"
    t.string   "wife_name"
    t.string   "wife_date_of_birth"
    t.string   "wedding_anniversary"
    t.string   "diocese_of_ordination"
    t.string   "ordination_date"
    t.string   "diocese_of_incardination"
    t.string   "incardination_date"
    t.string   "military_service"
    t.string   "military_branch"
    t.string   "military_period"
    t.string   "military_years"
    t.string   "military_rank"
    t.string   "faculties"
    t.string   "preaching"
    t.string   "status"
    t.string   "employer"
    t.string   "employer_address"
    t.string   "secondary_address"
    t.string   "secondary_city"
    t.string   "secondary_state"
    t.string   "secondary_zip"
    t.string   "secondary_phone"
    t.string   "assignment"
    t.string   "assignment_location"
    t.string   "assignment_pastor"
    t.string   "emergency_contact_name"
    t.string   "emergency_contract_phone"
    t.string   "highschool"
    t.string   "under_graduate"
    t.string   "graduate"
    t.string   "doctorate"
    t.string   "field_of_study"
    t.string   "prior_employment_description"
    t.string   "prior_diaconate_ministry"
    t.string   "picture"
  end

end
