class Product < ActiveRecord::Base
    has_one :order_item
end