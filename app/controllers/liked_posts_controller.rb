class LikedPostsController < ApplicationController
  def index
    params[:sort] ||= 'Hot'
    @user = User.find params[:user_id]
    @posts = @user.liked_posts
                  .sort(params[:sort])
                  .page(params[:page])
                  .per(20)
    render 'posts/index' if request.xhr?
  end
end
