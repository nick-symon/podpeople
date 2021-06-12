class ChangePodcastFieldsNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :podcasts, :subtitle, true
    change_column_null :podcasts, :link, true
    change_column_null :podcasts, :itunes_categories, true
    change_column_null :podcasts, :image_url, true
    change_column_null :podcasts, :image_title, true
    change_column_null :podcasts, :author_name, true
    change_column_null :podcasts, :description, true
    change_column_null :podcasts, :language, true
    change_column_null :podcasts, :slug, true
    change_column_null :podcasts, :itunes_subtitle, true
    change_column_null :podcasts, :itunes_summary, true
  end
end
