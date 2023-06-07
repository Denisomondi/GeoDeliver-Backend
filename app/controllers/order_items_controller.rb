# controllers/order_items_controller.rb
class OrderItemsController < Sinatra::Base
    # GET /order_items
    get '/order_items' do
      order_items = OrderItem.all
      order_items.to_json(include: :product)
    end
  
    # GET /order_items/:id
    get '/order_items/:id' do
      order_item = OrderItem.find(params[:id])
      order_item.to_json(include: :product)
    end
  
    # POST /order_items
    post '/order_items' do
      order_item = OrderItem.create(quantity: params[:quantity], unit_price: params[:unit_price], order_id: params[:order_id], product_id: params[:product_id])
      order_item.to_json
    end
  
    # PUT /order_items/:id
    put '/order_items/:id' do
      order_item = OrderItem.find(params[:id])
      order_item.update(quantity: params[:quantity], unit_price: params[:unit_price], order_id: params[:order_id], product_id: params[:product_id])
      order_item.to_json
    end
  
    # DELETE /order_items/:id
    delete '/order_items/:id' do
      order_item = OrderItem.find(params[:id])
      order_item.destroy
      status 204
    end
  end
  