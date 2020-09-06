class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    # @comment = Comment.new
    # @comment.user_id = current_user.id
    # @comment.topic_id = params[:topic_id]
    # @comment.comment = params[:comment]
    
    # if @comment.save
    #   redirect_to topics_path, success: 'コメントしました'
    # else
    #   flash.now[:danger]='コメントに失敗しました'
    #   render :new
    # end
    
    def create
      @comment = current_user.comments.new(comment_params)
      
      if @comment.save
        redirect_to topics_path, success: '投稿に成功しました'
      else
        flash.now[:danger] = "投稿に失敗しました"
        render :new
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment,:topic_id)
    end

end
