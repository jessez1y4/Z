class PostsController < ApplicationController
  respond_to :html, :js

  def index
    @posts = Post.all
  end

  def create
    preloaded = Cloudinary::PreloadedFile.new(params[:post][:cloudinary_data])
    raise "Invalid upload signature" if !preloaded.valid?
    @post = current_user.posts.build(cloudinary_id: preloaded.identifier)
    unless @post.save
      #TODO
    end
  end

  def from_web
    result = Cloudinary::Uploader.upload(params[:web_link])
    cloudinary_id = "v#{result['version']}/#{result['public_id']}.#{result['format']}"
    @post = current_user.posts.build(cloudinary_id: cloudinary_id)
    if @post.save
      render 'create'
    else
      #TODO
    end
  rescue CloudinaryException, Errno::ENOENT => e
    #TODO
  end
end
