class Product < ActiveRecord::Base
    has_many :order_items
  
    # Validation example: ensure name and price are present
    validates :name, presence: true
    validates :price, presence: true
  
    # You can define instance or class methods as needed
    def formatted_price
      "$#{'%.2f' % price}"
    end
  end
  