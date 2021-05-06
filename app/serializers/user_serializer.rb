class UserSerializer

    include FastJsonapi::ObjectSerializer
    attributes :email
    has_many :posts
    has_many :comments
    # has_many :friends, as: :users
    # has_many :followers, as: :users 
    # has_many :following, as: :users
end