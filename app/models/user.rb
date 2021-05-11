class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :as_follower, class_name: "Following", foreign_key: "follower_id", dependent: :destroy
  has_many :as_followed, class_name: "Following", foreign_key: "followed_id", dependent: :destroy
  has_many :followed_by_me, through: :as_follower, source: :followed_user
  has_many :following_me, through: :as_followed, source: :follower_user

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

  





  # ****** USE TBD ****** #

  # def add_friend(new_friend)
  #   if !self.friends.include?(new_friend)
  #     # add friend to your list
  #     self.friends << new_friend
  #     # add you to friend list
  #     new_friend.friends << self
  #     puts message: "Friend added!"
  #   else
  #     puts message: "Already friends"
  #   end
  # end
end
