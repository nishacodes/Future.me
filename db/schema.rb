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

ActiveRecord::Schema.define(:version => 20140116221805) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "linkedin_id"
  end

  create_table "company_departments", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "department_id"
  end

  create_table "company_industries", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "industry_id"
  end

  create_table "company_locations", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "location_id"
  end

  create_table "company_people", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "person_id"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "educations", :force => true do |t|
    t.string   "kind"
    t.string   "major"
    t.integer  "grad_yr"
    t.integer  "school_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "person_id"
  end

  create_table "industries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "jobtitles", :force => true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "company_id"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.decimal  "lat"
    t.decimal  "long"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "linkedin_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "linkedin_url"
  end

  create_table "person_schools", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "school_id"
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "location_id"
  end

end
