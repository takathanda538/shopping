class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :customer, null: false, foreign_key: true
      t.string  :name
      t.integer :postal_code, null: false
      t.string  :address, null: false

      t.timestamps
    end
  end
end
