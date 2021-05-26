class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :rating, default: 0
      t.text :content, null: false
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
