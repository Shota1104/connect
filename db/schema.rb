# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_11_060312) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "compnay", null: false
    t.string "name", null: false
    t.integer "phone", null: false
    t.string "num", null: false
    t.string "prefectures", null: false
    t.string "city", null: false
    t.string "area", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.bigint "room_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "explanation", null: false
    t.integer "insta_follower", null: false
    t.integer "insta_man", null: false
    t.integer "insta_woman", null: false
    t.integer "insta_age1", null: false
    t.integer "insta_age2", null: false
    t.integer "insta_age3", null: false
    t.integer "insta_age4", null: false
    t.integer "insta_age5", null: false
    t.integer "insta_age6", null: false
    t.integer "insta_age7", null: false
    t.integer "insta_reach", null: false
    t.integer "insta_impression", null: false
    t.integer "insta_click", null: false
    t.integer "youtube_follower"
    t.integer "youtube_man"
    t.integer "youtube_woman"
    t.integer "youtube_age1"
    t.integer "youtube_age2"
    t.integer "youtube_age3"
    t.integer "youtube_age4"
    t.integer "youtube_age5"
    t.integer "youtube_age6"
    t.integer "youtube_age7"
    t.integer "viewing"
    t.integer "audience"
    t.integer "youtube_impression"
    t.integer "twitter_follower"
    t.integer "twitter_man"
    t.integer "twitter_woman"
    t.integer "twitter_age1"
    t.integer "twitter_age2"
    t.integer "twitter_age3"
    t.integer "twitter_age4"
    t.integer "twitter_age5"
    t.integer "twitter_age6"
    t.integer "twitter_age7"
    t.integer "twitter_impression"
    t.integer "twitter_engagement"
    t.integer "twitter_click"
    t.integer "category_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "room_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_room_users_on_room_id"
    t.index ["user_id"], name: "index_room_users_on_user_id"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "kana_last_name", null: false
    t.string "kana_first_name", null: false
    t.string "account"
    t.string "company"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "room_users", "rooms"
  add_foreign_key "room_users", "users"
end
