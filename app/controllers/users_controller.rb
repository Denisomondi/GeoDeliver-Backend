# controllers/users_controller.rb
class UsersController < Sinatra::Base
    get '/users' do
      users = User.all
      users.to_json
    end
  
    post '/users' do
      user = User.create(params)
      user.to_json
    end
  
    # Implement other CRUD actions as needed
  end
  
