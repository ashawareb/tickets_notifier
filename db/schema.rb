# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_09_21_112711) do
  create_table "email_settings", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "send_due_date_reminder_email", default: true
    t.integer "due_date_reminder_email_interval", default: 0
    t.time "due_date_reminder_email_time", default: "2000-01-01 09:00:00"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_email_settings_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "description"
    t.integer "status", default: 1
    t.integer "reminder_status", default: 1
    t.string "job_id"
    t.date "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "time_zone", default: "Europe/Vienna"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
