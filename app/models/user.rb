# models/user.rb
class User < ActiveRecord::Base
    has_many :orders
  
    # Validation example: ensure name and email are present
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
  
    # You can define instance or class methods as needed
    def full_address
      "#{address}, #{city}, #{country}"
    end
  end
  