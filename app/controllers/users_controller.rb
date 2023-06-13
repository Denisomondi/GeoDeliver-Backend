require 'sinatra/base'
require 'json'
require 'sinatra/cross_origin'
require 'securerandom'

class UsersController < Sinatra::Base
  configure do
    enable :cross_origin
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*' # Allow requests from any origin
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, PATCH, DELETE' # Allow specific HTTP methods
    response.headers['Access-Control-Allow-Headers'] = 'Content-Type, Authorization' # Allow specific headers
    response.headers['Access-Control-Allow-Credentials'] = 'true' # Allow credentials (if needed)
  end

  register Sinatra::CrossOrigin

  # Enable CORS for all routes in this controller
  options '*' do
    response.headers['Allow'] = 'HEAD,GET,PUT,DELETE,OPTIONS,POST'
    response.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept'
    response.headers['Access-Control-Allow-Origin'] = '*'
    200 # Return an empty response with a 200 status code for preflight CORS requests
  end

  # Sample data for Users
  SAMPLE_DATA = [
    {
      id: 1,
      name: 'John Doe',
      email: 'johndoe@example.com',
      orders: [
        { id: 1, product: 'Product A', quantity: 2 },
        { id: 2, product: 'Product B', quantity: 1 }
      ]
    },
    {
      id: 2,
      name: 'Jane Smith',
      email: 'janesmith@example.com',
      orders: [
        { id: 3, product: 'Product C', quantity: 3 }
      ]
    }
  ]

  # GET /users
  get '/users' do
    name = params[:name]
    password = params[:password]
    user = find_user_by_credentials(name, password)

    if user
      user.to_json(include: :orders)
    else
      status 401
      { error: 'Invalid username or password' }.to_json
    end
  end

  # POST /users
  post '/users' do
    data = JSON.parse(request.body.read)
    name = data['name']
    password = data['password']

    if name && password
      user = create_user(name, password)
      status 201
      user.to_json
    else
      status 400
      { error: 'Invalid name or password' }.to_json
    end
  end

   # DELETE /users/:id
   delete '/users/:id' do |id|
    user = find_user_by_id(id)

    if user
      SAMPLE_DATA.delete(user)
      status 204
    else
      status 404
      { error: 'User not found' }.to_json
    end
  end

  # PATCH /users/:id
  patch '/users/:id' do |id|
    data = JSON.parse(request.body.read)
    name = data['name']
    password = data['password']

    user = find_user_by_id(id)

    if user
      user[:name] = name if name
      user[:password] = password if password
      user.to_json
    else
      status 404
      { error: 'User not found' }.to_json
    end
  end

  private

  def find_user_by_credentials(name, password)
    SAMPLE_DATA.find { |user| user[:name] == name && user[:password] == password }
  end

  def find_user_by_id(id)
    SAMPLE_DATA.find { |user| user[:id] == id.to_i }
  end

  def create_user(name, password)
    id = SecureRandom.uuid
    new_user = { id: id, name: name, password: password, orders: [] }
    SAMPLE_DATA << new_user
    new_user
  end
end

# Run the server if this file is executed directly
if __FILE__ == $0
  UsersController.run!
end
