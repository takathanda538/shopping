class CreateOrderDetils < ActiveRecord::Migration[6.1]
  def change
    create_table :order_detils do |t|
      t.references :order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :price
      t.integer :amount
      t.integer :making_status

      t.timestamps
    end
  end
end
