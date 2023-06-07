  # models/order.rb
  class Order < ActiveRecord::Base
    belongs_to :user
  end
  