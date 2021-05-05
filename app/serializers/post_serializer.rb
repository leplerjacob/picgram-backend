class PostSerializer
    include FastJsonapi::ObjectSerializer
    attributes :image, :description, :user_id
    belongs_to :user
    has_many :comments
end