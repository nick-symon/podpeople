class AddUniqueIndices < ActiveRecord::Migration[6.1]
  def change
    add_index :likes, [:profile_id, :likeable_id, :likeable_type], unique: true 
    add_index :reviews, [:profile_id, :podcast_id], unique: true 
  end
end
