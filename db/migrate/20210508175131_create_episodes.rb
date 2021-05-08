class CreateEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :episodes, id: false do |t|
      t.text :guid, null: false, primary_key: true
      t.text :itunes_season, null: false
      t.text :itunes_episode, null: false
      t.text :publised_date
      t.text :link, null: false
      t.text :description, null: false
      t.text :duration, null: false
      t.text :enclosure_type, null: false
      t.text :enclosure_url, null: false
      t.text :title, null: false
      t.text :itunes_summary, null: false
      t.text :itunes_subtitle, null: false
      t.text :slug, null: false
      t.text :podcast_id, null: false
      t.index :guid, unique: true
      t.timestamps
    end
  end
end
