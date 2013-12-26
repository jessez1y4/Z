class PostsController < ApplicationController
  respond_to :html, :js

  def index
    sleep(0.5) # temporary code to simulate real internet latency
    @posts = Post.page(params[:page]).per(2) # only 2 posts a page to test infinite scroll
  end

  def new
    preloaded = Cloudinary::PreloadedFile.new(params[:post][:cloudinary_data])
    raise "Invalid upload signature" if !preloaded.valid?
    # @cloudinary_id = preloaded.identifier
    @post = Post.new(cloudinary_id: preloaded.identifier)
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
    @post = Post.includes(:items).includes(:user).find(params[:id])
    @comments = @post.comments.includes(:user)
    @comment = @post.comments.build
  end

  def edit
    @post = Post.find(params[:id])
    render 'new'
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      #TODO
    end
  end

  private

  def post_params
    params.require(:post).permit(:cloudinary_id, :title, :description, items_attributes: [:id, :name, :number, :x, :y, :_destroy])
  end
end
