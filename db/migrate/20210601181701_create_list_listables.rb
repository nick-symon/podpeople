class CreateListListables < ActiveRecord::Migration[6.1]
  def change
    create_table :list_listables do |t|
      t.belongs_to :list, foreign_key: true
      t.references :listable, polymorphic: true
      t.timestamps
    end
  end
end
