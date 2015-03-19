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

ActiveRecord::Schema.define(:version => 20130828124240) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "invitations", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "user_id"
    t.string   "medium"
    t.integer  "profile_id"
    t.boolean  "send_email",   :default => true
    t.boolean  "second_email", :default => false
  end

  create_table "profiles", :force => true do |t|
    t.text     "business_name"
    t.text     "address"
    t.text     "city"
    t.text     "state"
    t.text     "zip"
    t.text     "phone"
    t.datetime "created_at",                                                                            :null => false
    t.datetime "updated_at",                                                                            :null => false
    t.integer  "user_id"
    t.text     "description",              :limit => 255
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "website"
    t.string   "review_link"
    t.string   "review_name"
    t.string   "product_question",                        :default => "What product did you purchase?"
    t.string   "product_placeholder",                     :default => "Put an example here."
    t.string   "page_header_file_name"
    t.string   "page_header_content_type"
    t.integer  "page_header_file_size"
    t.datetime "page_header_updated_at"
    t.string   "page_color"
    t.boolean  "yelp_score"
    t.string   "yelp_score_value"
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "reviews", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "score"
    t.boolean  "recommendation"
    t.text     "review"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.boolean  "contact"
    t.string   "reviewer_first"
    t.string   "reviewer_last"
    t.string   "user_name"
    t.string   "user_id"
    t.string   "city"
    t.string   "product_description"
    t.string   "public"
    t.integer  "invitation_id"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email",                  :default => "",     :null => false
    t.string   "encrypted_password",     :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "profile_id"
    t.boolean  "admin",                  :default => false
    t.string   "user_account_type",      :default => "free"
    t.string   "customer_id"
    t.string   "product_description",    :default => "off"
    t.boolean  "follow_up_email"
    t.boolean  "second_email_request"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
