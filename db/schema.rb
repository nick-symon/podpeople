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

ActiveRecord::Schema.define(version: 2021_05_08_175131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", id: false, force: :cascade do |t|
    t.text "guid", null: false
    t.text "itunes_season", null: false
    t.text "itunes_episode", null: false
    t.text "publised_date"
    t.text "link", null: false
    t.text "description", null: false
    t.text "duration", null: false
    t.text "enclosure_type", null: false
    t.text "enclosure_url", null: false
    t.text "title", null: false
    t.text "itunes_summary", null: false
    t.text "itunes_subtitle", null: false
    t.text "slug", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "podcasts", id: false, force: :cascade do |t|
    t.text "id", null: false
    t.text "subtitle", null: false
    t.text "rss_feed_link", null: false
    t.text "link", null: false
    t.text "itunes_categories", null: false, array: true
    t.text "image_url", null: false
    t.text "image_title", null: false
    t.text "last_build_date"
    t.text "author_name", null: false
    t.text "description", null: false
    t.text "language", null: false
    t.text "title", null: false
    t.text "slug", null: false
    t.text "itunes_subtitle", null: false
    t.text "itunes_summary", null: false
    t.text "pub_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
