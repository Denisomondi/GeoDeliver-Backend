require 'securerandom'

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :uid, default: SecureRandom.uuid, null: false

      t.timestamps
    end

    add_index :users, :uid, unique: true
  end
end
