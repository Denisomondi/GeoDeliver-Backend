class OrdersController < Sinatra::Base
    # ...
  
    get '/orders/:id' do
      order = Order.find(params[:id])
      order.to_json(include: { order_items: { include: :product } })
    end
  
    # ...
  end