require_relative './users_controller'
require_relative './orders_controller'
require_relative './order_items_controller'
require_relative './products_controller'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

   # Mount other controllers here
   use UsersController
   use OrdersController
   use ProductsController
   use OrderItemsController

end
