class PostsController < ApplicationController
  impressionist actions: [:show],
                unique: [:impressionable_type, :impressionable_id, :session_hash]

  def home
    if user_signed_in?
      @following_posts = Post.following(current_user).hottest.limit(12)
      @hot_posts = Post.hottest.limit(12)
      @new_posts = Post.newest.limit(12)
      # @top_tags = Tag.top(10)
      @star_users = User.star.limit(9)
    else
      redirect_to posts_url
    end
  end

  def index
    params[:scope] ||= 'Everything'
    params[:sort] ||= 'Hot'

    @posts = Post.scope(params[:scope], current_user)
                 .sort(params[:sort])
                 .page(params[:page])
                 .per(20)
  end

  def search
    @posts = Post.search(params[:search]).page(params[:page]).per(20)
    render 'index' if request.xhr?
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
    @post = Post.includes(:items).find_by_slug!(params[:id])
    @prev_post = Post.where(["created_at > ?", @post.created_at]).first
    @next_post = Post.where(["created_at < ?", @post.created_at]).last

    @user = @post.user
    @more_posts = @user.posts.hottest.exclude(@post).limit(4)

    if user_signed_in?
      @may_like_posts = @post.similar_posts.hottest.exclude(@post).exclude(current_user.liked_posts.pluck(:id)).exclude_user(current_user).limit(5)

      @may_like_posts = Post.hottest.exclude_user(current_user).exclude_user(current_user.followed_users.pluck(:id)).exclude(current_user.liked_posts.pluck(:id)).limit(5) if @may_like_posts.empty?
    else
      @may_like_posts = @post.similar_posts.hottest.exclude(@post).limit(5)

      @may_like_posts = Post.hottest.limit(5) if @may_like_posts.empty?
    end

    if user_signed_in?
      @may_like_ppl = @user.followed_users.star.exclude(current_user.followed_users.pluck(:id)).exclude(current_user).limit(3)
      @may_like_ppl = User.star.exclude(current_user.followed_users.pluck(:id)).exclude(current_user).exclude(@user).limit(3) if @may_like_ppl.empty?
    else
      @may_like_ppl = User.star.exclude(@user).limit(3)
    end

    @tags = @post.tags.top

    @comments = @post.comments
                     .includes(:user)
                     .page(params[:page])
                     .per(8)
    @comment = @post.comments.build
  end

  def edit
    @post = Post.find_by_slug!(params[:id])
    render 'new'
  end

  def update
    @post = Post.find_by_slug!(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      #TODO
    end
  end

  def destroy
    @post = Post.find_by_slug!(params[:id])
    @post.destroy!
    redirect_to current_user, notice: "\<#{@post.title.titleize}\> has been deleted."
  end

  private

  def post_params
    params.require(:post).permit(:cloudinary_id,
                                 :crop_str,
                                 :title,
                                 :tag_list,
                                 items_attributes: [
                                   :id,
                                   :name,
                                   :number,
                                   :x,
                                   :y,
                                   :_destroy,
                                   :item_category_id,
                                   :url
                                 ])
  end
end
