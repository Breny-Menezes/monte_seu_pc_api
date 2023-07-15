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

ActiveRecord::Schema.define(version: 2023_07_15_180140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assembly_pc_requests", force: :cascade do |t|
    t.string "customer_name"
    t.string "customer_document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "motherboards", force: :cascade do |t|
    t.string "description"
    t.integer "supported_processing_unit"
    t.integer "available_ram_slots"
    t.integer "max_ram_supported"
    t.boolean "integrated_video_card"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_computer_ram_memories", force: :cascade do |t|
    t.bigint "personal_computer_id"
    t.bigint "ram_memory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_computers", force: :cascade do |t|
    t.bigint "assembly_pc_request_id"
    t.bigint "motherboard_id"
    t.bigint "processing_unit_id"
    t.bigint "video_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "processing_units", force: :cascade do |t|
    t.string "description"
    t.integer "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ram_memories", force: :cascade do |t|
    t.string "description"
    t.integer "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "video_cards", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
