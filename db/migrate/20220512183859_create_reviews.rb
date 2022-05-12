class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.references :purchase, null: false, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
