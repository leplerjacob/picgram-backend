class PostSerializer
    # serializer allows us to customize data
    include FastJsonapi::ObjectSerializer
    attributes :image, :description, :user_id
    belongs_to :user
    has_many :comments
end