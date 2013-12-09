class PostsController < ApplicationController
  respond_to :html, :js

  def index
    @posts = Post.all
  end

  def new
    preloaded = Cloudinary::PreloadedFile.new(params[:post][:cloudinary_data])
    raise "Invalid upload signature" if !preloaded.valid?
    @cloudinary_id = preloaded.identifier
    @post = Post.new
  end

  def create
  end
end
