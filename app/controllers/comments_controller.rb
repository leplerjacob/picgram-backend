class CommentsController < ApplicationController
    
    def index
        comments = Comment.all
        render json: comments
    end

    def show 
        comment = Comment.find(params[:id])
        render json: comment
    end

    def create
        comment = Comment.new(comment_params)

        if comment.save
            render json: CommentSerializer.new(@comment), status: :created
        else
            error_resp = {
                error: @comment.error.full_messages.to_sentence
            }
            render json: error_resp, status: unprocessable_entity
        end
    
    end

    def update
        if @comment.update(comment_params)
      
            render json: CommentSerializer.new(@comment), status: :ok
        else
            error_resp = {
                error: @comment.errors.full_messages.to_sentence
              }
            render json: error_resp, status: :unprocessable_entity 
        end       
    end

    def destroy
        comment = Comment.find(params[:id])
        if player.destroy
            render json: {id: comment.id}
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:id, :text, :post_id, :user_id)
    end

end
