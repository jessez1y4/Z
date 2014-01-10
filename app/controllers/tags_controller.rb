class TagsController < ApplicationController
  def show
    params[:sort] ||= 'Hot this month'
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.sort(params[:sort]).page(params[:page]).per(10)
    render 'posts/index_grid' if request.xhr?
  end
end
