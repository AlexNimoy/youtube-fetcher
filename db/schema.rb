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

ActiveRecord::Schema[7.0].define(version: 2019_04_04_064854) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at", precision: nil
    t.datetime "locked_at", precision: nil
    t.datetime "failed_at", precision: nil
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "cron"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "episodes", force: :cascade do |t|
    t.integer "podcast_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "media"
    t.string "title"
    t.integer "media_size"
    t.text "description"
    t.datetime "published_at", precision: nil
    t.string "origin_id"
    t.string "type", default: "AudioEpisode", null: false
    t.index ["origin_id"], name: "index_episodes_on_origin_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "email", null: false
    t.string "title", null: false
    t.string "category", null: false
    t.text "body"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "flipper_features", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["key"], name: "index_flipper_features_on_key", unique: true
  end

  create_table "flipper_gates", force: :cascade do |t|
    t.string "feature_key", null: false
    t.string "key", null: false
    t.string "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["feature_key", "key", "value"], name: "index_flipper_gates_on_feature_key_and_key_and_value", unique: true
  end

  create_table "metrics", force: :cascade do |t|
    t.string "key"
    t.text "data_set"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["key"], name: "index_metrics_on_key", unique: true
  end

  create_table "pending_episodes", force: :cascade do |t|
    t.string "origin_id"
    t.string "episode_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "origin_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "source_type"
    t.string "title"
    t.datetime "accessed_at", precision: nil
    t.datetime "video_requested_at", precision: nil
    t.datetime "fetched_at", precision: nil
    t.boolean "deleted", default: false, null: false
    t.index ["origin_id"], name: "index_podcasts_on_origin_id", unique: true
  end

  create_table "user_agents", force: :cascade do |t|
    t.datetime "last_pageview_at", precision: nil
    t.string "user_agent"
    t.text "cookies"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  add_foreign_key "episodes", "podcasts"
end
