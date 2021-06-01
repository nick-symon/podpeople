class ChangeListListablestoListJoins < ActiveRecord::Migration[6.1]
  def change
    rename_table :list_listables, :list_joins 
  end
end
