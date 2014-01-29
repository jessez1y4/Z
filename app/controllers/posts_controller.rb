class PostsController < ApplicationController
  impressionist actions: [:show],
                unique: [:impressionable_type, :impressionable_id, :session_hash]

  def home
    @hot_posts = Post.sort('Hot').limit(8)
    @most_viewed_posts = Post.sort('Most Viewed').limit(8)
    @top_tags = Tag.top(10)
  end

  def index
    params[:scope] ||= 'Everything'
    params[:sort] ||= 'Hot'

    @posts = Post.scope(params[:scope], current_user)
                 .sort(params[:sort])
                 .page(params[:page])
                 .per(20)
  end

  def crop
    preloaded = Cloudinary::PreloadedFile.new(params[:cloudinary_data])
    raise "Invalid upload signature" if !preloaded.valid?
    @cloudinary_id = preloaded.identifier
  end

  def new
    crop_str = "x_#{params[:crop_x]},y_#{params[:crop_y]},w_#{params[:crop_w]},h_#{params[:crop_h]},c_crop/"
    @post = Post.new(cloudinary_id: params[:cloudinary_id],
                     crop_str: crop_str)
    @post.tag_list = current_user.default_tag_list
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
    @prev_post = Post.where(["created_at > ?", @post.created_at]).first
    @next_post = Post.where(["created_at < ?", @post.created_at]).last

    @user = @post.user

    @tags = @post.tags.top

    @comments = @post.comments
                     .includes(:user)
                     .page(params[:page])
                     .per(5)
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to current_user, notice: "\<#{@post.title.titleize}\> has been deleted."
  end

  private

  def post_params
    params.require(:post).permit(:cloudinary_id,
                                 :crop_str,
                                 :title,
                                 :description,
                                 :tag_list,
                                 items_attributes: [:id,
                                                    :name,
                                                    :number,
                                                    :x,
                                                    :y,
                                                    :_destroy])
  end
end
