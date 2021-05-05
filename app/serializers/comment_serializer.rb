class CommentSerializer
    # serializer allows us to customize data
    include FastJsonapi::ObjectSerializer
    attributes :text, :post_id, :user_id
    belongs_to :user
    belongs_to :post
end