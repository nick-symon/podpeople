class CreatePodcasts < ActiveRecord::Migration[6.1]
  def change
    create_table :podcasts, id: false  do |t|
      t.text :id, null: false, primary_key: true
      t.text :subtitle, null: false 
      t.text :rss_feed_link, null: false 
      t.text :link, null: false 
      t.text :itunes_categories, null: false, array: true 
      t.text :image_url, null: false 
      t.text :image_title, null: false
      t.text :last_build_date
      t.text :author_name, null: false
      t.text :description, null: false
      t.text :language, null: false
      t.text :title, null: false
      t.text :slug, null: false
      t.text :itunes_subtitle, null: false
      t.text :itunes_summary, null: false
      t.text :pub_date
      t.index :id, unique: true
      t.index :rss_feed_link, unique: true
      t.timestamps
    end
  end
end
