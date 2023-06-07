# models/order_item.rb
class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :product
  
    # Validation example: ensure quantity and unit_price are present
    validates :quantity, presence: true
    validates :unit_price, presence: true
  end
  