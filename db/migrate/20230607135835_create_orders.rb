class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.decimal :total_amount
      t.string :status
      t.timestamps
    end
  end
end
