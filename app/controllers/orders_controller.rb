require_relative '../models/order'
require_relative '../models/order_item'
require 'sinatra/base'
require 'json'
require 'sinatra/cross_origin'
require 'securerandom'

class OrdersController < Sinatra::Base
  get '/orders' do
    orders = Order.all
    orders.to_json(include: { order_items: { include: :product } })
  end

  get '/orders/:id' do
    order = Order.find(params[:id])
    order.to_json(include: { order_items: { include: :product } })
  end

  post '/orders' do
    order_data = JSON.parse(request.body.read)
    order = Order.create(
      user_id: order_data['user_id'],
      total_amount: order_data['total_amount']
    )
    order.to_json
  end

  get '/orders/history/:user_id' do
    user_orders = Order.where(user_id: params[:user_id])
    user_orders.to_json(include: { order_items: { include: :product } })
  end
 
  post '/orders' do
    order_data = JSON.parse(request.body.read)
    order = Order.create(
      user_id: order_data['user_id'],
      total_amount: order_data['total_amount'],
      created_at: Time.now
    )
    order.to_json
  end

  delete '/orders/:id' do
    order = Order.find(params[:id])
    order.destroy
    status 204
  end
end
