class TagsController < ApplicationController
  def show
    params[:sort] ||= 'Hot this month'
    @tag = Tag.find(params[:id])
    @posts = Post.scope(params, current_user).page(params[:page]).per(10)
    render 'posts/index_grid' if request.xhr?
  end
end
