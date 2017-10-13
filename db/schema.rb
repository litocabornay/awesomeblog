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

ActiveRecord::Schema.define(version: 20171011130712) do

  create_table "adds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bank_histories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "price_from"
    t.integer  "price"
    t.integer  "price_to"
    t.string   "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "details", force: :cascade do |t|
    t.string   "company_name"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "company_name_sounds"
    t.string   "company_reception"
    t.string   "company_president"
    t.string   "company_president_sound"
    t.string   "company_post_number"
    t.string   "company_place"
    t.string   "company_place_detail"
    t.string   "company_call_number"
    t.string   "company_fax_number"
    t.string   "company_branch"
    t.string   "company_type"
    t.string   "company_union"
    t.string   "company_reception_sound"
    t.string   "company_position"
    t.string   "company_post_number_contact"
    t.string   "company_place_contact"
    t.string   "company_call_number_contact"
    t.string   "company_call_number_contact_name_1"
    t.string   "company_call_number_contact_tel_1"
    t.string   "company_call_number_contact_name_2"
    t.string   "company_call_number_contact_tel_2"
    t.string   "company_call_number_contact_name_3"
    t.string   "company_call_number_contact_tel_3"
    t.string   "company_call_number_contact_name_4"
    t.string   "company_call_number_contact_tel_4"
    t.string   "company_call_number_contact_name_5"
    t.string   "company_call_number_contact_tel_5"
    t.string   "company_call_number_contact_name_6"
    t.string   "company_call_number_contact_tel_6"
    t.string   "company_call_time_from_1"
    t.string   "company_call_time_from_2"
    t.string   "company_call_time_to_1"
    t.string   "company_call_time_to_2"
    t.string   "company_fax_number_contact"
    t.string   "company_call_number_emergency"
    t.string   "company_url"
    t.string   "company_mail_address"
    t.string   "company_place_detail_contact"
    t.text     "company_pr"
  end

  create_table "flows", force: :cascade do |t|
    t.string   "company"
    t.integer  "before_price",    default: 0
    t.integer  "year_date"
    t.integer  "month_date"
    t.integer  "day_date"
    t.integer  "price",           default: 0
    t.integer  "after_price",     default: 0
    t.string   "staff"
    t.string   "memo"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "content"
    t.string   "pass_company"
    t.string   "recieve_company"
  end

  create_table "inquiries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "makers", force: :cascade do |t|
    t.string   "name"
    t.string   "name2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", unique: true
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "rails", force: :cascade do |t|
    t.string   "generate"
    t.string   "model"
    t.string   "pay_relationship"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "saves", force: :cascade do |t|
    t.string   "status",               default: "在庫中"
    t.string   "name"
    t.string   "staff",                default: "まだ"
    t.string   "staff_two",            default: "まだ"
    t.string   "type_machine"
    t.string   "from"
    t.string   "to"
    t.string   "number"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "machine"
    t.integer  "price_from"
    t.integer  "price_after"
    t.string   "remarks"
    t.string   "photo"
    t.string   "place"
    t.string   "maker"
    t.string   "year_of_manufacture"
    t.string   "month_of_manufacture"
  end

  create_table "sells", force: :cascade do |t|
    t.string   "content_type"
    t.string   "name"
    t.string   "maker"
    t.integer  "number"
    t.string   "cylinder"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "status",       default: "受付中"
    t.string   "place"
    t.integer  "price"
    t.string   "removal_date"
    t.string   "remnant",      default: "撤去済"
    t.string   "stage"
    t.string   "condition"
    t.string   "remarks"
    t.string   "type_machine"
  end

  add_index "sells", ["user_id"], name: "index_sells_on_user_id"

  create_table "stocks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "staff"
    t.string   "type"
    t.string   "status"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "company_name"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",                              default: false
    t.boolean  "bank",                               default: false
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "money",                              default: 0
    t.integer  "money_yet",                          default: 0
    t.string   "company_name_sounds"
    t.string   "company_reception"
    t.string   "company_president"
    t.string   "company_president_sound"
    t.string   "company_post_number"
    t.string   "company_place"
    t.string   "company_place_detail"
    t.string   "company_call_number"
    t.string   "company_fax_number"
    t.string   "company_branch"
    t.string   "company_type"
    t.string   "company_union"
    t.string   "company_reception_sound"
    t.string   "company_position"
    t.string   "company_post_number_contact"
    t.string   "company_place_contact"
    t.string   "company_call_number_contact"
    t.string   "company_call_number_contact_name_1"
    t.string   "company_call_number_contact_tel_1"
    t.string   "company_call_number_contact_name_2"
    t.string   "company_call_number_contact_tel_2"
    t.string   "company_call_number_contact_name_3"
    t.string   "company_call_number_contact_tel_3"
    t.string   "company_call_number_contact_name_4"
    t.string   "company_call_number_contact_tel_4"
    t.string   "company_call_number_contact_name_5"
    t.string   "company_call_number_contact_tel_5"
    t.string   "company_call_number_contact_name_6"
    t.string   "company_call_number_contact_tel_6"
    t.string   "company_call_time_from_1"
    t.string   "company_call_time_from_2"
    t.string   "company_call_time_to_1"
    t.string   "company_call_time_to_2"
    t.string   "company_fax_number_contact"
    t.string   "company_call_number_emergency"
    t.string   "company_url"
    t.string   "company_mail_address"
    t.string   "company_place_detail_contact"
    t.text     "company_pr"
    t.integer  "reccent_deposit"
    t.string   "bank_name"
    t.string   "bank_branch"
    t.string   "bank_username"
    t.string   "bank_type"
    t.integer  "bank_number"
  end

  create_table "withdrows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "message"
    t.string   "status"
  end

end
