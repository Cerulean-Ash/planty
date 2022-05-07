class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :title
      t.float :price_per_clipping
      t.text :description
      t.integer :number_of_clippings
      t.string :color
      t.string :care_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
