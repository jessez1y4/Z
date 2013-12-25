class CommentsController < ActionController::Base
  def create
    if params[:post_id]
      @commentable = Post.find(params[:post_id])
    elsif params[:user_id]
      @commentable = User.find(params[:user_id])
    end

    comment = @commentable.comments.build(comment_params)
    if comment.save
      respond_to do |format|
        format.html { redirect_to @commentable }
        format.js
      end
    else
      #TODO
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
