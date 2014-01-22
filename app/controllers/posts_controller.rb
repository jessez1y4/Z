class PostsController < ApplicationController
  def index
    params[:scope] ||= 'Everything'
    params[:sort] ||= 'Hot'

    @posts = Post.scope(params[:scope], current_user)
                 .sort(params[:sort])
                 .page(params[:page])
                 .per(20)
  end

  def new
    preloaded = Cloudinary::PreloadedFile.new(params[:cloudinary_data])
    raise "Invalid upload signature" if !preloaded.valid?
    # @cloudinary_id = preloaded.identifier
    @post = Post.new(cloudinary_id: preloaded.identifier)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      render 'new'
    end
  end

  def show
    @post = Post.includes(:items).find(params[:id])
    @user = @post.user
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
    params.require(:post).permit(:cloudinary_id, :title, :description, :tag_list, items_attributes: [:id, :name, :number, :x, :y, :_destroy])
  end
end
