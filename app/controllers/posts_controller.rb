class PostsController < ApplicationController

    def index
        posts = Post.all
        render json: posts
    end

    def show 
        post = Post.find(params[:id])
        render json: post
    end

    def create
        post = Post.new(post_params)

        if post.save
            render json: PostSerializer.new(@post), status: :created
        else
            error_resp = {
                error: @post.error.full_messages.to_sentence
            }
            render json: error_resp, status: unprocessable_entity
        end
    
    end

    def update
        if @post.update(post_params)
      
            render json: PostSerializer.new(@post), status: :ok
        else
            error_resp = {
                error: @post.errors.full_messages.to_sentence
              }
            render json: error_resp, status: :unprocessable_entity 
        end       
    end

    def destroy
        post = Post.find(params[:id])
        if player.destroy
            render json: {id: post.id}
        end
    end

    private

    def post_params
        params.require(:post).permit(:id, :image, :description, :user_id)
    end
end
