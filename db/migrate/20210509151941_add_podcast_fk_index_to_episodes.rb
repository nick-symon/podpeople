class AddPodcastFkIndexToEpisodes < ActiveRecord::Migration[6.1]
  def change
    add_index :episodes, :podcast_id, :name => 'podcast_id_foreign_key_index'
  end
end
