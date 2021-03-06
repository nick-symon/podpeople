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

ActiveRecord::Schema.define(version: 2021_06_15_193415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", primary_key: "guid", id: :text, force: :cascade do |t|
    t.text "itunes_season"
    t.text "itunes_episode"
    t.text "published_date"
    t.text "link"
    t.text "description"
    t.text "duration"
    t.text "enclosure_type", null: false
    t.text "enclosure_url", null: false
    t.text "title", null: false
    t.text "itunes_summary"
    t.text "itunes_subtitle"
    t.text "slug"
    t.text "podcast_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guid"], name: "index_episodes_on_guid", unique: true
    t.index ["podcast_id"], name: "podcast_id_foreign_key_index"
  end

  create_table "likes", force: :cascade do |t|
    t.string "likeable_type"
    t.bigint "likeable_id"
    t.bigint "profile_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable"
    t.index ["profile_id", "likeable_id", "likeable_type"], name: "index_likes_on_profile_id_and_likeable_id_and_likeable_type", unique: true
    t.index ["profile_id"], name: "index_likes_on_profile_id"
  end

  create_table "list_joins", force: :cascade do |t|
    t.bigint "list_id"
    t.string "listable_type"
    t.bigint "listable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id"], name: "index_list_joins_on_list_id"
    t.index ["listable_type", "listable_id"], name: "index_list_listables_on_listable"
  end

  create_table "lists", force: :cascade do |t|
    t.text "name", null: false
    t.text "description"
    t.bigint "profile_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_lists_on_name"
    t.index ["profile_id"], name: "index_lists_on_profile_id"
  end

  create_table "podcasts", id: :text, force: :cascade do |t|
    t.text "subtitle"
    t.text "rss_feed_link", null: false
    t.text "link"
    t.text "itunes_categories", array: true
    t.text "image_url"
    t.text "image_title"
    t.text "last_build_date"
    t.text "author_name"
    t.text "description"
    t.text "language"
    t.text "title", null: false
    t.text "slug"
    t.text "itunes_subtitle"
    t.text "itunes_summary"
    t.text "pub_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id"], name: "index_podcasts_on_id", unique: true
    t.index ["rss_feed_link"], name: "index_podcasts_on_rss_feed_link", unique: true
  end

  create_table "profiles", force: :cascade do |t|
    t.string "location"
    t.string "bio"
    t.string "website"
    t.string "pronoun"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
    t.index ["username"], name: "index_profiles_on_username", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.bigint "profile_id", null: false
    t.text "podcast_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["podcast_id"], name: "index_reviews_on_podcast_id"
    t.index ["profile_id", "podcast_id"], name: "index_reviews_on_profile_id_and_podcast_id", unique: true
    t.index ["profile_id"], name: "index_reviews_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
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

  add_foreign_key "episodes", "podcasts"
  add_foreign_key "likes", "profiles"
  add_foreign_key "list_joins", "lists"
  add_foreign_key "lists", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "podcasts"
  add_foreign_key "reviews", "profiles"
end
