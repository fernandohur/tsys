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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20130320161013) do
=======
ActiveRecord::Schema.define(:version => 20130331170419) do
>>>>>>> af511e755cf62e747ddca958f5d3d177d2d73787

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.integer  "thesis_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "anotations", :force => true do |t|
    t.string   "id_source"
    t.string   "texto"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "data_files", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.boolean  "allDay"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "meeting_notes", :force => true do |t|
    t.string   "noteText"
    t.integer  "meeting_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "meeting_tasks", :force => true do |t|
    t.string   "task"
    t.integer  "meeting_id"
    t.boolean  "done"
    t.datetime "expireDate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "meetings", :force => true do |t|
    t.datetime "dateMeeting"
    t.string   "noteMeeting"
    t.integer  "thesis_id"
    t.string   "path"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "notes", :force => true do |t|
    t.text     "noteText"
    t.integer  "source_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "activity_id"
    t.integer  "student_id"
    t.string   "file_url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "professors", :force => true do |t|
    t.string   "nombre"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.string   "descripccion"
    t.integer  "thesis_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "category"
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password"
    t.integer  "thesis_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "theses", :force => true do |t|
    t.string   "name"
    t.integer  "student_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
