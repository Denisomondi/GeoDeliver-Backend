class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price
      t.timestamps
    end
  end
end
