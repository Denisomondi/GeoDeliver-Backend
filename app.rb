require_relative './app/controllers/users_controller'
require_relative './app/controllers/orders_controller'
require_relative './app/controllers/order_items_controller'
require_relative './app/controllers/products_controller'
require 'sinatra/base'
require 'sinatra'
require 'sinatra/cross_origin'

class ApplicationController < Sinatra::Base
  configure do
    enable :cross_origin
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*' # Allow requests from any origin
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE' # Allow specific HTTP methods
    response.headers['Access-Control-Allow-Headers'] = 'Content-Type, Authorization' # Allow specific headers
    response.headers['Access-Control-Allow-Credentials'] = 'true' # Allow credentials (if needed)
  end

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

# Run the ApplicationController as the main Sinatra application
ApplicationController.run!
