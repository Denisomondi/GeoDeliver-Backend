# controllers/orders_controller.rb
class OrdersController < Sinatra::Base
    # GET /orders
    get '/orders' do
      orders = Order.all
      orders.to_json(include: { order_items: { include: :product } })
    end
  
    # GET /orders/:id
    get '/orders/:id' do
      order = Order.find(params[:id])
      order.to_json(include: { order_items: { include: :product } })
    end
  
    # POST /orders
    post '/orders' do
      order = Order.create(total_amount: params[:total_amount], status: params[:status], user_id: params[:user_id])
      order.to_json
    end
  
    # PUT /orders/:id
    put '/orders/:id' do
      order = Order.find(params[:id])
      order.update(total_amount: params[:total_amount], status: params[:status], user_id: params[:user_id])
      order.to_json
    end
  
    # DELETE /orders/:id
    delete '/orders/:id' do
      order = Order.find(params[:id])
      order.destroy
      status 204
    end
  end
  