class RemoveNullFieldsFromEpisodes < ActiveRecord::Migration[6.1]
  def change
    change_column_null :episodes, :itunes_season, true
    change_column_null :episodes, :itunes_episode, true
    change_column_null :episodes, :link, true
    change_column_null :episodes, :description, true
    change_column_null :episodes, :duration, true
    change_column_null :episodes, :itunes_summary, true
    change_column_null :episodes, :slug, true
  end
end
