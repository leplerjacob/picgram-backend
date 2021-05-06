class User < ApplicationRecord
  has_many :posts
  has_many :comments
  # has_many :friendships, dependent: :destroy
  # has_many :friends, through: :friendships
  # has_many :followers, as: :users 
  # has_many :following, as: :users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable
        #  :recoverable, :rememberable, :validatable, 

  #  Including only the user's id into the encrypted token
  def generate_jwt
    JWT.encode({
      id: id, 
      exp: 60.days.from_now.to_i
      }, 
      Rails.application.secrets.secret_key_base
    )
  end
end
