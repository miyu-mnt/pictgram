class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id]
    comment.comment = params(comment_params)
    
    if comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      redirect_to topics_path, danger: 'コメントに失敗しました'
    end
  end
  
  def comment_params
      params.require(:comment).permit(:comment_form)
  end
  
end
