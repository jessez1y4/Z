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
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      #TODO
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:cloudinary_id, :name, :description, items_attributes: [:name, :number, :x, :y, :_destroy])
  end
end
