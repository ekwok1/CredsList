class CreateTxns < ActiveRecord::Migration
  def change
    create_table :txns do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :buyer_id
      t.references :item, index: true, foreign_key: true
      t.integer :seller_rating
      t.integer :buyer_rating

      t.timestamps null: false
    end
  end
end
