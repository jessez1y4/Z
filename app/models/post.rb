class Post < ActiveRecord::Base
  belongs_to :user

  has_many :items, -> { order('number ASC') }
  has_many :comments, as: :commentable

  has_many :like_relationships, dependent: :destroy
  has_many :likers, source: :user, through: :like_relationships

  accepts_nested_attributes_for :items, allow_destroy: true


  def likes
    likers.size
  end

  def self.scope(params, current_user)
    params[:channel] ||= 'Everything'
    params[:sort] ||= 'Hot this week'

    case params[:channel]
    when 'Following'
      posts = Post.where(user_id: current_user.followed_users).references(:users)
    when 'Everything'
      posts = Post.all
    end

    case params[:sort]
    when 'Newest'
      posts = posts.order('created_at DESC')
    when 'Hot today'
      posts = posts.where('created_at >= ?', Time.now - 1.day).order('post_likes_count DESC')
    when 'Hot this week', nil
      posts = posts.where('created_at >= ?', Time.now - 1.week).order('post_likes_count DESC')
    when 'Hot this month'
      posts = posts.where('created_at >= ?', Time.now - 1.month).order('post_likes_count DESC')
    when 'Hot all time'
      posts = posts.order('post_likes_count DESC')
    end

    posts
  end
end
