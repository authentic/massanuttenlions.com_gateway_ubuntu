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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150907141716) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "clubs", :force => true do |t|
    t.string   "name"
    t.string   "meeting_address"
    t.string   "mailing_address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "state",                   :default => "Virginia"
    t.string   "email"
    t.string   "president_email"
    t.string   "webmaster_email"
    t.string   "newsletter_editor_email"
    t.string   "secretary_email"
    t.string   "photographer_email"
    t.string   "phone"
    t.string   "current_year"
    t.datetime "avatar_updated_at"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.string   "avatar_file_name"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "lomfi_president_email"
    t.string   "treasurer_email"
  end

  create_table "mercury_images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "newsletters", :force => true do |t|
    t.text     "header"
    t.text     "footer"
    t.text     "content",                       :null => false
    t.boolean  "visible",    :default => false
    t.date     "period"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "pages", :force => true do |t|
    t.integer  "subject_id"
    t.string   "name"
    t.string   "permalink"
    t.integer  "position"
    t.boolean  "visible",      :default => false
    t.string   "content_type", :default => "HTML"
    t.text     "content"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "pages", ["permalink"], :name => "index_pages_on_permalink"
  add_index "pages", ["subject_id"], :name => "index_pages_on_subject_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.boolean  "visible",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",            :null => false
    t.string   "encrypted_password",     :default => "",            :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "avatar_updated_at"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.string   "avatar_file_name"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "user_name",                                         :null => false
    t.string   "first_name",                                        :null => false
    t.string   "last_name",                                         :null => false
    t.string   "spouse_first_name"
    t.date     "birthday",                                          :null => false
    t.string   "member_as_of"
    t.text     "biography"
    t.string   "street",                                            :null => false
    t.string   "house_number",                                      :null => false
    t.string   "postal_code",            :default => "22840",       :null => false
    t.string   "city",                   :default => "Massanutten", :null => false
    t.string   "state",                  :default => "Virginia",    :null => false
    t.string   "phone",                                             :null => false
    t.string   "status",                 :default => "Active"
    t.string   "leadership",             :default => "Non"
    t.string   "officers",               :default => "Non"
    t.string   "webmaster",              :default => "Non"
    t.string   "newsletter_editor",      :default => "Non"
    t.string   "photographer",           :default => "Non"
    t.string   "signature",                                         :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["first_name"], :name => "index_users_on_first_name"
  add_index "users", ["house_number"], :name => "index_users_on_house_number"
  add_index "users", ["last_name"], :name => "index_users_on_last_name"
  add_index "users", ["leadership"], :name => "index_users_on_leadership"
  add_index "users", ["newsletter_editor"], :name => "index_users_on_newsletter_editor"
  add_index "users", ["officers"], :name => "index_users_on_officers"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["status"], :name => "index_users_on_status"
  add_index "users", ["street"], :name => "index_users_on_street"
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  add_index "users", ["user_name"], :name => "index_users_on_user_name", :unique => true
  add_index "users", ["webmaster"], :name => "index_users_on_webmaster"

end
