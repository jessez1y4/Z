class TagsController < ApplicationController
  def show
    params[:sort] ||= 'Hot'
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
                 .sort(params[:sort])
                 .page(params[:page])
                 .per(20)
    render 'posts/index' if request.xhr?
  end
end
