# models/order.rb
class Order < ActiveRecord::Base
    belongs_to :user
    has_many :order_items
  
    # Validation example: ensure total_amount and status are present
    validates :total_amount, presence: true
    validates :status, presence: true
  
    # You can define instance or class methods as needed
    def calculate_total_amount
      order_items.sum('quantity * unit_price')
    end
  end
  