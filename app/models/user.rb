class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def generate_new_authentication_token
    token = User.generate_unique_secure_token #active record function
    update_attributes authentication_token: token
  end
end
