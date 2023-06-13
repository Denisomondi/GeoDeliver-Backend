class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :orderid, primary_key: true
      t.integer :user_id
      t.decimal :total_amount

      t.timestamps
    end
  end
end
