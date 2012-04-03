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

ActiveRecord::Schema.define(:version => 20120403122404) do

  create_table "customers", :force => true do |t|
    t.string   "app_key",    :limit => 20, :null => false
    t.string   "name"
    t.string   "email"
    t.integer  "number"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "customers", ["app_key"], :name => "UNIQUE_customers", :unique => true

  create_table "feedbacks", :force => true do |t|
    t.integer  "customer_id",                :null => false
    t.integer  "staff_id",                   :null => false
    t.text     "message",                    :null => false
    t.string   "status",                     :null => false
    t.integer  "feedback_id", :default => 0, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "feedbacks", ["customer_id", "created_at"], :name => "INDEX_feedback_by_time"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "routes", :force => true do |t|
    t.string "name", :limit => 100, :null => false
  end

  create_table "schedule_stops", :force => true do |t|
    t.integer "schedule_id",                :null => false
    t.integer "stop_id",                    :null => false
    t.time    "arrives_at",                 :null => false
    t.time    "departs_at",                 :null => false
    t.integer "delay",       :default => 2, :null => false
  end

  add_index "schedule_stops", ["arrives_at"], :name => "INDEX_schedule_stops_by_arrival_time"

  create_table "schedules", :force => true do |t|
    t.time     "departs_at", :null => false
    t.time     "arrives_at", :null => false
    t.integer  "route_id",   :null => false
    t.integer  "train_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "schedules", ["route_id"], :name => "INDEX_schedules_by_route"

  create_table "staffs", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "staffs", ["email"], :name => "index_staffs_on_email", :unique => true
  add_index "staffs", ["reset_password_token"], :name => "index_staffs_on_reset_password_token", :unique => true

  create_table "stops", :force => true do |t|
    t.string  "name",                           :null => false
    t.boolean "is_terminus", :default => false, :null => false
  end

  create_table "tickets", :force => true do |t|
    t.string   "number",                                                                     :null => false
    t.decimal  "amount",                    :precision => 5, :scale => 2,                    :null => false
    t.string   "status",      :limit => 12,                               :default => "new", :null => false
    t.integer  "schedule_id",                                                                :null => false
    t.integer  "customer_id",                                                                :null => false
    t.datetime "created_at",                                                                 :null => false
    t.datetime "updated_at",                                                                 :null => false
  end

  add_index "tickets", ["number"], :name => "UNIQUE_tickets", :unique => true

  create_table "trains", :force => true do |t|
    t.string   "number",     :null => false
    t.integer  "cabins",     :null => false
    t.integer  "seats",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "trains", ["number"], :name => "UNIQUE_trains", :unique => true

end
