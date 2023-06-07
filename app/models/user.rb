# models/user.rb
class User < ActiveRecord::Base
    has_many :orders
  end
  
