class RemoveAdditionalNullConstraintEpisodes < ActiveRecord::Migration[6.1]
  def change
    change_column_null :episodes, :itunes_subtitle, true
  end
end
