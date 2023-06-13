require 'active_record'
require 'securerandom'

class Order
  attr_accessor :id, :user_id, :total_amount, :created_at

  def initialize(attributes = {})
    @id = attributes[:id] || SecureRandom.uuid
    @user_id = attributes[:user_id]
    @total_amount = attributes[:total_amount]
    @created_at = attributes[:created_at] || Time.now
  end

  def self.create(order_params)
    order = Order.new(order_params)
    order.save ? order : nil
  end

  def self.all
    @orders ||= []
  end

  def save
    self.class.all << self
  end
end
