class CreateCharges < ActiveRecord::Migration[6.1]
  def change
    create_table :charges do |t|
      t.references :user, null: false, foreign_key: true
      t.text :delivery_address
      t.string :first_name
      t.string :last_name
      t.string :additional_address
      t.string :phone_number

      t.timestamps
    end
  end
end
