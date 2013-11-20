class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    preloaded = Cloudinary::PreloadedFile.new(params[:post][:cloudinary_data])
    raise "Invalid upload signature" if !preloaded.valid?
    @post = Post.new(cloudinary_id: preloaded.identifier)
    unless @post.save
      #TODO
    end
  end

  def from_web
  end
end
