class TagsController < ApplicationController
  def show
    params[:sort] ||= 'Hot this month'
    @tag = Tag.find(params[:id])
    @posts = Post.with_tag(@tag.name).sort(params[:sort]).page(params[:page]).per(10)
    render 'posts/index_grid' if request.xhr?
  end
end
