class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.text :name, null: false, index: true
      t.text :description
      t.string :listable_type
      t.bigint :listable_id, array: true, default: [] 
      t.belongs_to :profile, foreign_key: true
      t.timestamps
    end
  end
end
