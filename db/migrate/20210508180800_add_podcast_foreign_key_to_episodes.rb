class AddPodcastForeignKeyToEpisodes < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :episodes, :podcasts
  end
end
