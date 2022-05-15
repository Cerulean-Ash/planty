class AddChargeToPurchases < ActiveRecord::Migration[6.1]
  def change
    add_reference :purchases, :charge, null: true, foreign_key: true
    change_column :purchases, :cart_id, :bigint, null: true
  end
end
