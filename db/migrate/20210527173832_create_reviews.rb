class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.belongs_to :profile, null: false, foreign_key: true
      t.belongs_to :podcast, type: :text, null: false, foreign_key: true

      t.timestamps
    end
  end
end
