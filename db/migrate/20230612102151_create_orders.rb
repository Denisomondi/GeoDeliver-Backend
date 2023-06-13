class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :total_amount, precision: 10, scale: 2
      t.string :status

      t.timestamps
    end
  end
end
