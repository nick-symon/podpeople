class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer, :rating
      t.text, :content
      t.belongs_to, :user
      t.belongs_to :podcast, null: false, foreign_key: true

      t.timestamps
    end
  end
end
