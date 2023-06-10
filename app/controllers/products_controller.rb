require 'sinatra/base'
require 'sinatra/cross_origin'
require 'json'

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

  # Initialize an empty array to store products
  @@products = []

  # Sample data
  product1 = {
    "id" => 1,
    "name" => "Product 1",
    "price" => 9.99,
    "image" => "https://img.freepik.com/free-psd/banner-bookstore-ad-template_23-2148680419.jpg?w=996&t=st=1686129615~exp=1686130215~hmac=cb585a523e8daa409753561e1882da5d2d6fdb130782b3e86df9e22bb2edf9d4",
    "category" => "Books",
    "description" => "Lorem ipsum dolor sit amet."
  }

  product2 = {
    "id" => 2,
    "name" => "Headphone",
    "price" => 14.99,
    "image" => "https://img.freepik.com/free-photo/levitating-music-headphones-display_23-2149817605.jpg?w=996&t=st=1686217434~exp=1686218034~hmac=51dcb913875d1da27c270fa97380b852ee3f6938e5a1b663a0e7654bed97daa8",
    "category" => "Electronics",
    "description" => "Consectetur adipiscing elit."
  }

  product3 = {
    "id" => 3,
    "name" => "Product 3",
    "price" => 19.99,
    "image" => "https://img.freepik.com/free-psd/banner-bookstore-ad-template_23-2148680419.jpg?w=996&t=st=1686129615~exp=1686130215~hmac=cb585a523e8daa409753561e1882da5d2d6fdb130782b3e86df9e22bb2edf9d4",
    "category" => "Fashion",
    "description" => "Sed auctor metus vel enim finibus lacinia."
  }

  product4 = {
    "id" => 4,
    "name" => "Product 4",
    "price" => 24.99,
    "image" => "https://img.freepik.com/free-photo/autumn-woman-fashion-portrait_23-2149314973.jpg?w=996&t=st=1686217249~exp=1686217849~hmac=1c3b086f6e067875f1740b92b25a2b2ab4852e19bc3c4389dce8424aa6383c36",
    "category" => "Fashion",
    "description" => "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam efficitur ipsum a turpis venenatis vehicula."
  }

  product5 = {
    "id" => 5,
    "name" => "Headphones",
    "price" => 29.99,
    "image" => "https://img.freepik.com/free-psd/banner-bookstore-ad-template_23-2148680419.jpg?w=996&t=st=1686129615~exp=1686130215~hmac=cb585a523e8daa409753561e1882da5d2d6fdb130782b3e86df9e22bb2edf9d4",
    "category" => "Books",
    "description" => "Etiam et ligula vel nisi fermentum tincidunt. Nulla facilisi."
  }

  product6 = {
    "id" => 6,
    "name" => "Product 6",
    "price" => 34.99,
    "image" => "https://img.freepik.com/free-photo/levitating-music-headphones-display_23-2149817605.jpg?w=996&t=st=1686217434~exp=1686218034~hmac=51dcb913875d1da27c270fa97380b852ee3f6938e5a1b663a0e7654bed97daa8",
    "category" => "Electronics",
    "description" => "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas."
  }

  product7 = {
    "id" => 7,
    "name" => "Product 7",
    "price" => 39.99,
    "image" => "https://img.freepik.com/free-photo/beautiful-young-woman-lying-grass-field-relaxing_23-2149270105.jpg?w=996&t=st=1686217856~exp=1686218456~hmac=0b1b54bb6758d4d0e27513f117f8de3c18c51bba3666a7b2e3b8f99aef9b6dd2",
    "category" => "Fashion",
    "description" => "Aliquam erat volutpat. Donec lacinia metus in dolor ultrices condimentum."
  }

  product8 = {
    "id" => 8,
    "name" => "Product 8",
    "price" => 44.99,
    "image" => "https://img.freepik.com/free-photo/mid-adult-male-farmer-touching-wheat-field_23-2149252807.jpg?w=996&t=st=1686217048~exp=1686217648~hmac=afdd29e7498c37a2552ebbf07454b3c70c41a9340eaf9968e6f0fbf69da8a075",
    "category" => "Home & Garden",
    "description" => "Donec at cursus tellus, et consequat neque. Cras efficitur felis sit amet arcu placerat rhoncus."
  }

  product9 = {
    "id" => 9,
    "name" => "Product 9",
    "price" => 49.99,
    "image" => "https://img.freepik.com/free-psd/banner-bookstore-ad-template_23-2148680419.jpg?w=996&t=st=1686129615~exp=1686130215~hmac=cb585a523e8daa409753561e1882da5d2d6fdb130782b3e86df9e22bb2edf9d4",
    "category" => "Books",
    "description" => "Cras non risus sed mi aliquam luctus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae."
  }

  product10 = {
    "id" => 10,
    "name" => "Product 10",
    "price" => 54.99,
    "image" => "https://img.freepik.com/free-photo/levitating-music-headphones-display_23-2149817605.jpg?w=996&t=st=1686217434~exp=1686218034~hmac=51dcb913875d1da27c270fa97380b852ee3f6938e5a1b663a0e7654bed97daa8",
    "category" => "Electronics",
    "description" => "Sed id nibh non massa malesuada semper ut id tellus."
  }

  # Add the sample products to the array
  @@products << product1
  @@products << product2
  @@products << product3
  @@products << product4
  @@products << product5
  @@products << product6
  @@products << product7
  @@products << product8
  @@products << product9
  @@products << product10

  # GET /products
  get '/products' do
    query = params[:query].to_s.downcase.strip
  
    if query.empty?
      @@products.to_json
    else
      filtered_products = @@products.select { |product| product['name'].downcase.include?(query) }
      filtered_products.to_json
    end
  end

  # POST /products
  post '/products' do
    request.body.rewind
    product_data = JSON.parse(request.body.read)

    # Create a new product object
    product = {
      "id" => rand(1..100).to_s,
      "name" => product_data['name'],
      "price" => product_data['price'],
      "image" => product_data['image'],
      "category" => product_data['category'],
      "description" => product_data['description']
    }

    # Add the product to the array
    @@products << product
    response.set_cookie(
      'cookieName',
      value: 'Lax',
      same_site: 'None',
      secure: true
    )

    # Return the created product
    product.to_json
  end

  # POST /cart/add
  post '/cart/add' do
    request.body.rewind
    product_data = JSON.parse(request.body.read)

    # Find the product by ID
    product = @@products.find { |p| p['id'] == product_data['productId'] }

    # Add the product to the cart
    # You can store the cart data in a session, database, or any other storage mechanism
    # Here, we assume you have a cart array stored in the session
    session[:cart] ||= []
    session[:cart] << product

    # Return a success message
    { message: 'Product added to cart' }.to_json
  end

  # GET /cart
  get '/cart' do
    # Retrieve the cart data from the session
    # Here, we assume you have a cart array stored in the session
    cart = session[:cart] || []
    response.set_cookie(
      'cookieName',
      value: 'Lax',
      same_site: 'None',
      secure: true
    )

    # Return the cart data
    cart.to_json
  end

  # DELETE /cart/remove/:id
  delete '/cart/remove/:id' do
    # Retrieve the product ID from the URL
    product_id = params[:id]

    # Find the product in the cart by ID
    # Here, we assume you have a cart array stored in the session
    cart = session[:cart] || []
    product_index = cart.index { |p| p['id'] == product_id }

    # Remove the product from the cart if found
    if product_index
      cart.delete_at(product_index)
      { message: 'Product removed from cart' }.to_json
    else
      { message: 'Product not found in cart' }.to_json
    end
  end
end

