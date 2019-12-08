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

ActiveRecord::Schema.define(version: 20191208092412) do

  create_table "archives", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "device_types", force: :cascade do |t|
    t.string   "name"
    t.text     "comment"
    t.string   "sparam1"
    t.string   "sparam2"
    t.string   "sparam3"
    t.string   "iparam1"
    t.string   "iparam2"
    t.string   "iparam3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: :cascade do |t|
    t.string   "name"
    t.integer  "hardware_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "device_type_id"
    t.integer  "status"
    t.string   "description"
    t.text     "comment"
    t.string   "sparam1"
    t.string   "sparam2"
    t.string   "sparam3"
    t.string   "iparam1"
    t.string   "iparam2"
    t.string   "iparam3"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "from_time"
    t.datetime "to_time"
    t.boolean  "permanent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "group_relations", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "groupable_id"
    t.string   "groupable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "group_relations", ["group_id"], name: "index_group_relations_on_group_id"
  add_index "group_relations", ["groupable_type", "groupable_id"], name: "index_group_relations_on_groupable_type_and_groupable_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.boolean  "global"
    t.string   "short_name"
  end

  create_table "hardware_models", force: :cascade do |t|
    t.string   "name"
    t.string   "modelNo"
    t.text     "comment"
    t.string   "sparam1"
    t.string   "sparam2"
    t.string   "sparam3"
    t.integer  "iparam1"
    t.integer  "iparam2"
    t.integer  "iparam3"
    t.integer  "hardware_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "hardware_models", ["hardware_type_id"], name: "index_hardware_models_on_hardware_type_id"

  create_table "hardware_types", force: :cascade do |t|
    t.string   "name"
    t.text     "comment"
    t.string   "sparam1"
    t.string   "sparam2"
    t.string   "sparam3"
    t.string   "iparam1"
    t.string   "iparam2"
    t.string   "iparam3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hardwares", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "model"
    t.integer  "hardware_type_id"
    t.integer  "location_id"
    t.integer  "device_id"
    t.integer  "param_id"
    t.integer  "operation_system_id"
    t.string   "serial_number"
    t.string   "inv_number"
    t.string   "identificator"
    t.string   "ip_adr_adm"
    t.string   "ip_adr"
    t.integer  "el_power"
    t.text     "comment"
    t.string   "login"
    t.string   "password"
    t.string   "sparam1"
    t.string   "sparam2"
    t.string   "sparam3"
    t.integer  "iparam1"
    t.integer  "iparam2"
    t.integer  "iparam3"
    t.string   "model_number"
    t.string   "place"
    t.integer  "status"
    t.string   "description"
    t.integer  "height"
    t.integer  "user_id"
    t.integer  "hardware_model_id"
    t.boolean  "canBook"
    t.integer  "parent_id"
    t.integer  "group_id"
    t.integer  "position"
  end

  create_table "licenses", force: :cascade do |t|
    t.integer  "lic_type"
    t.string   "name"
    t.datetime "from_time"
    t.datetime "to_time"
    t.integer  "lic_count"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "software_type_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "reservable_id"
    t.string   "reservable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "reservations", ["event_id"], name: "index_reservations_on_event_id"
  add_index "reservations", ["reservable_type", "reservable_id"], name: "index_reservations_on_reservable_type_and_reservable_id"

  create_table "software_types", force: :cascade do |t|
    t.string   "name"
    t.text     "comment"
    t.string   "sparam1"
    t.string   "sparam2"
    t.string   "sparam3"
    t.string   "iparam1"
    t.string   "iparam2"
    t.string   "iparam3"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "software_type"
    t.integer  "vendor_id"
    t.boolean  "commercial"
    t.string   "version"
  end

  create_table "softwares", force: :cascade do |t|
    t.integer  "software_type_id"
    t.string   "sparam1"
    t.string   "sparam2"
    t.string   "sparam3"
    t.integer  "iparam1"
    t.integer  "iparam2"
    t.integer  "iparam3"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "comment"
    t.integer  "license_id"
    t.integer  "installable_id"
    t.string   "installable_type"
  end

  add_index "softwares", ["software_type_id"], name: "index_softwares_on_software_type_id"

  create_table "user_messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "user_messages", ["commentable_type", "commentable_id"], name: "index_user_messages_on_commentable_type_and_commentable_id"
  add_index "user_messages", ["user_id"], name: "index_user_messages_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "firstname"
    t.string   "secondname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "short_name"
  end

  create_table "vmhosts", force: :cascade do |t|
    t.integer  "hardware_id"
    t.string   "name"
    t.string   "esxi_version"
    t.integer  "cpu_count"
    t.integer  "cpu_core_count"
    t.integer  "memory_size"
    t.text     "hardware_description"
    t.integer  "powerState"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "vendor"
    t.string   "model"
    t.string   "uuid"
    t.integer  "cpu_thread_count"
    t.float    "cpu_ghz"
    t.text     "cpu"
    t.integer  "cpu_usage"
    t.float    "cpu_usage_percent"
    t.integer  "memory_usage"
    t.float    "memory_free_percent"
  end

  add_index "vmhosts", ["hardware_id"], name: "index_vmhosts_on_hardware_id"

  create_table "vmresourcepools", force: :cascade do |t|
    t.integer  "vmhost_id"
    t.string   "name"
    t.integer  "status"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "vmresourcepools", ["vmhost_id"], name: "index_vmresourcepools_on_vmhost_id"

  create_table "vms", force: :cascade do |t|
    t.integer  "vmresourcepool_id"
    t.string   "name"
    t.string   "guest"
    t.string   "uuid"
    t.integer  "state"
    t.string   "ip"
    t.datetime "boottime"
    t.string   "annotation"
    t.boolean  "vmtools"
    t.string   "path"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.integer  "archive_id"
  end

  add_index "vms", ["vmresourcepool_id"], name: "index_vms_on_vmresourcepool_id"

end
