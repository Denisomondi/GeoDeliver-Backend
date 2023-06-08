require 'sinatra/base'
require 'sinatra/cross_origin'

class ProductsController < Sinatra::Base
  configure do
    enable :cross_origin
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*' # Allow requests from any origin
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE' # Allow specific HTTP methods
    response.headers['Access-Control-Allow-Headers'] = 'Content-Type, Authorization' # Allow specific headers
    response.headers['Access-Control-Allow-Credentials'] = 'true' # Allow credentials (if needed)
  end

  # Enable CORS for all routes in this controller
  options '*' do
    response.headers['Allow'] = 'HEAD,GET,PUT,DELETE,OPTIONS,POST'
    response.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept'
    response.headers['Access-Control-Allow-Origin'] = '*'
    200 # Return an empty response with a 200 status code for preflight CORS requests
  end

  # GET /products
  get '/products' do
    products = [
      { id: 1, name: 'Product 1', price: 9.99, image: 'https://img.freepik.com/free-psd/banner-bookstore-ad-template_23-2148680419.jpg?w=996&t=st=1686129615~exp=1686130215~hmac=cb585a523e8daa409753561e1882da5d2d6fdb130782b3e86df9e22bb2edf9d4', description: 'Lorem ipsum dolor sit amet.' },
      { id: 2, name: 'Product 2', price: 14.99, image: 'https://img.freepik.com/free-photo/levitating-music-headphones-display_23-2149817605.jpg?w=996&t=st=1686217434~exp=1686218034~hmac=51dcb913875d1da27c270fa97380b852ee3f6938e5a1b663a0e7654bed97daa8', description: 'Consectetur adipiscing elit.' },
      { id: 3, name: 'Product 3', price: 19.99, image: "https://img.freepik.com/free-psd/banner-bookstore-ad-template_23-2148680419.jpg?w=996&t=st=1686129615~exp=1686130215~hmac=cb585a523e8daa409753561e1882da5d2d6fdb130782b3e86df9e22bb2edf9d4', description: 'Lorem ipsum dolor sit amet.", description: 'Sed auctor metus vel enim finibus lacinia.' }
      # Add more products as needed
    ]
    products.to_json
  end

  # GET /products/:id
  get '/products/:id' do
    product = Product.find(params[:id])
    product.to_json
  end

  # POST /products
  post '/products' do
    product = Product.create(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    product.to_json
  end

  # PUT /products/:id
  put '/products/:id' do
    product = Product.find(params[:id])
    product.update(name: params[:name], price: params[:price], description: params[:description])
    product.to_json
  end

  # DELETE /products/:id
  delete '/products/:id' do
    product = Product.find(params[:id])
    product.destroy
    status 204
  end
end
