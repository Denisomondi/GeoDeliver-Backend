  # controllers/orders_controller.rb
  class OrdersController < Sinatra::Base
    get '/orders' do
      orders = Order.all
      orders.to_json
    end
  
    post '/orders' do
      order = Order.create(params)
      order.to_json
    end
  
    # Implement other CRUD actions as needed
  end
  