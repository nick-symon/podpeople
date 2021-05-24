class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :location
      t.string :bio
      t.string :website
      t.string :pronoun
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
