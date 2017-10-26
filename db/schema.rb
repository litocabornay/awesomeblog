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

ActiveRecord::Schema.define(version: 20171022025710) do

  create_table "adds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bank_histories", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "price_from", limit: 4
    t.integer  "price",      limit: 4
    t.integer  "price_to",   limit: 4
    t.string   "action",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "details", force: :cascade do |t|
    t.string   "company_name",                       limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "company_name_sounds",                limit: 255
    t.string   "company_reception",                  limit: 255
    t.string   "company_president",                  limit: 255
    t.string   "company_president_sound",            limit: 255
    t.string   "company_post_number",                limit: 255
    t.string   "company_place",                      limit: 255
    t.string   "company_place_detail",               limit: 255
    t.string   "company_call_number",                limit: 255
    t.string   "company_fax_number",                 limit: 255
    t.string   "company_branch",                     limit: 255
    t.string   "company_type",                       limit: 255
    t.string   "company_union",                      limit: 255
    t.string   "company_reception_sound",            limit: 255
    t.string   "company_position",                   limit: 255
    t.string   "company_post_number_contact",        limit: 255
    t.string   "company_place_contact",              limit: 255
    t.string   "company_call_number_contact",        limit: 255
    t.string   "company_call_number_contact_name_1", limit: 255
    t.string   "company_call_number_contact_tel_1",  limit: 255
    t.string   "company_call_number_contact_name_2", limit: 255
    t.string   "company_call_number_contact_tel_2",  limit: 255
    t.string   "company_call_number_contact_name_3", limit: 255
    t.string   "company_call_number_contact_tel_3",  limit: 255
    t.string   "company_call_number_contact_name_4", limit: 255
    t.string   "company_call_number_contact_tel_4",  limit: 255
    t.string   "company_call_number_contact_name_5", limit: 255
    t.string   "company_call_number_contact_tel_5",  limit: 255
    t.string   "company_call_number_contact_name_6", limit: 255
    t.string   "company_call_number_contact_tel_6",  limit: 255
    t.string   "company_call_time_from_1",           limit: 255
    t.string   "company_call_time_from_2",           limit: 255
    t.string   "company_call_time_to_1",             limit: 255
    t.string   "company_call_time_to_2",             limit: 255
    t.string   "company_fax_number_contact",         limit: 255
    t.string   "company_call_number_emergency",      limit: 255
    t.string   "company_url",                        limit: 255
    t.string   "company_mail_address",               limit: 255
    t.string   "company_place_detail_contact",       limit: 255
    t.text     "company_pr",                         limit: 65535
  end

  create_table "flows", force: :cascade do |t|
    t.string   "company",         limit: 255
    t.integer  "before_price",    limit: 4,   default: 0
    t.integer  "year_date",       limit: 4
    t.integer  "month_date",      limit: 4
    t.integer  "day_date",        limit: 4
    t.integer  "price",           limit: 4,   default: 0
    t.integer  "after_price",     limit: 4,   default: 0
    t.string   "staff",           limit: 255
    t.string   "memo",            limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "content",         limit: 255
    t.string   "pass_company",    limit: 255
    t.string   "recieve_company", limit: 255
  end

  create_table "inquiries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "makers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "name2",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "picture",    limit: 255
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", unique: true, using: :btree
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id", using: :btree

  create_table "rails", force: :cascade do |t|
    t.string   "generate",         limit: 255
    t.string   "model",            limit: 255
    t.string   "pay_relationship", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4
    t.integer  "followed_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "saves", force: :cascade do |t|
    t.string   "status",               limit: 255, default: "在庫中"
    t.string   "name",                 limit: 255
    t.string   "staff",                limit: 255, default: "まだ"
    t.string   "staff_two",            limit: 255, default: "まだ"
    t.string   "type_machine",         limit: 255
    t.string   "from",                 limit: 255
    t.string   "to",                   limit: 255, default: "まだ"
    t.string   "number",               limit: 255
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.string   "machine",              limit: 255
    t.integer  "price_from",           limit: 4
    t.integer  "price_after",          limit: 4
    t.string   "remarks",              limit: 255
    t.string   "photo",                limit: 255, default: "No-image-found.jpg"
    t.string   "place",                limit: 255
    t.string   "maker",                limit: 255
    t.string   "year_of_manufacture",  limit: 255
    t.string   "month_of_manufacture", limit: 255
    t.date     "date_of_verification"
    t.date     "date_of_removal"
    t.string   "color_of_panel",       limit: 255
    t.string   "number_of_frame",      limit: 255
    t.string   "number_of_foundation", limit: 255
    t.string   "string",               limit: 255
    t.date     "date_of_out"
    t.string   "number_slot",          limit: 255
  end

  create_table "sells", force: :cascade do |t|
    t.string   "content_type", limit: 255
    t.string   "name",         limit: 255
    t.string   "maker",        limit: 255
    t.integer  "number",       limit: 4
    t.string   "cylinder",     limit: 255
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "status",       limit: 255, default: "受付中"
    t.string   "place",        limit: 255
    t.integer  "price",        limit: 4
    t.string   "removal_date", limit: 255
    t.string   "remnant",      limit: 255, default: "撤去済"
    t.string   "stage",        limit: 255
    t.string   "condition",    limit: 255
    t.string   "remarks",      limit: 255
    t.string   "type_machine", limit: 255
  end

  add_index "sells", ["user_id"], name: "index_sells_on_user_id", using: :btree

  create_table "stocks", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
    t.string   "staff",      limit: 255
    t.string   "type",       limit: 255
    t.string   "status",     limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                               limit: 255
    t.string   "email",                              limit: 255
    t.string   "company_name",                       limit: 255
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.string   "password_digest",                    limit: 255
    t.string   "remember_digest",                    limit: 255
    t.boolean  "admin",                                            default: false
    t.boolean  "bank",                                             default: false
    t.string   "activation_digest",                  limit: 255
    t.boolean  "activated"
    t.datetime "activated_at"
    t.string   "reset_digest",                       limit: 255
    t.datetime "reset_sent_at"
    t.integer  "money",                              limit: 4,     default: 0
    t.integer  "money_yet",                          limit: 4,     default: 0
    t.string   "company_name_sounds",                limit: 255
    t.string   "company_reception",                  limit: 255
    t.string   "company_president",                  limit: 255
    t.string   "company_president_sound",            limit: 255
    t.string   "company_post_number",                limit: 255
    t.string   "company_place",                      limit: 255
    t.string   "company_place_detail",               limit: 255
    t.string   "company_call_number",                limit: 255
    t.string   "company_fax_number",                 limit: 255
    t.string   "company_branch",                     limit: 255
    t.string   "company_type",                       limit: 255
    t.string   "company_union",                      limit: 255
    t.string   "company_reception_sound",            limit: 255
    t.string   "company_position",                   limit: 255
    t.string   "company_post_number_contact",        limit: 255
    t.string   "company_place_contact",              limit: 255
    t.string   "company_call_number_contact",        limit: 255
    t.string   "company_call_number_contact_name_1", limit: 255
    t.string   "company_call_number_contact_tel_1",  limit: 255
    t.string   "company_call_number_contact_name_2", limit: 255
    t.string   "company_call_number_contact_tel_2",  limit: 255
    t.string   "company_call_number_contact_name_3", limit: 255
    t.string   "company_call_number_contact_tel_3",  limit: 255
    t.string   "company_call_number_contact_name_4", limit: 255
    t.string   "company_call_number_contact_tel_4",  limit: 255
    t.string   "company_call_number_contact_name_5", limit: 255
    t.string   "company_call_number_contact_tel_5",  limit: 255
    t.string   "company_call_number_contact_name_6", limit: 255
    t.string   "company_call_number_contact_tel_6",  limit: 255
    t.string   "company_call_time_from_1",           limit: 255
    t.string   "company_call_time_from_2",           limit: 255
    t.string   "company_call_time_to_1",             limit: 255
    t.string   "company_call_time_to_2",             limit: 255
    t.string   "company_fax_number_contact",         limit: 255
    t.string   "company_call_number_emergency",      limit: 255
    t.string   "company_url",                        limit: 255
    t.string   "company_mail_address",               limit: 255
    t.string   "company_place_detail_contact",       limit: 255
    t.text     "company_pr",                         limit: 65535
    t.integer  "reccent_deposit",                    limit: 4
    t.string   "bank_name",                          limit: 255
    t.string   "bank_branch",                        limit: 255
    t.string   "bank_username",                      limit: 255
    t.string   "bank_type",                          limit: 255
    t.integer  "bank_number",                        limit: 4
  end

  create_table "withdrows", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "price",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "message",    limit: 255
    t.string   "status",     limit: 255
  end

  add_foreign_key "microposts", "users"
  add_foreign_key "sells", "users"
end
