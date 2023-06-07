# controllers/users_controller.rb
class UsersController < Sinatra::Base
    # GET /users
    get '/users' do
      users = User.all
      users.to_json(include: :orders)
    end
  
    # GET /users/:id
    get '/users/:id' do
      user = User.find(params[:id])
      user.to_json(include: :orders)
    end
  
    # POST /users
    post '/users' do
      user = User.create(name: params[:name], email: params[:email])
      user.to_json
    end
  
    # PUT /users/:id
    put '/users/:id' do
      user = User.find(params[:id])
      user.update(name: params[:name], email: params[:email])
      user.to_json
    end
  
    # DELETE /users/:id
    delete '/users/:id' do
      user = User.find(params[:id])
      user.destroy
      status 204
    end
  end
  