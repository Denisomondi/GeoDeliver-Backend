class UsersController < Sinatra::Base
    # ...
  
    get '/users/:id' do
      user = User.find(params[:id])
      user.to_json(include: :orders)
    end
  
    # ...
  end