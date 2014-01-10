class Post < ActiveRecord::Base
  belongs_to :user, counter_cache: true

  has_many :items, -> { order('number ASC') }
  has_many :comments, as: :commentable

  has_many :like_relationships, dependent: :destroy
  has_many :likers, source: :user, through: :like_relationships

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  accepts_nested_attributes_for :items, allow_destroy: true

  # scope :page_with_counter_cache, lambda {|page_number, total_count_value|
  #   page(page_number).extending {
  #     # open scope to smuggle total_count
  #     define_method(:total_count) { total_count_value }
  #   }
  # }


  def likes
    like_relationships_count
  end

  def self.scope(params, current_user)
    posts = Post.all

    if params[:user_id]
      posts = posts.where(user_id: params[:user_id])
      params[:sort] ||= 'Newest'
    elsif params[:channel_id]
      channel = Channel.find(params[:channel_id])
      posts = posts.where(user_id: channel.users)
      params[:sort] ||= 'Hot this month'
    elsif params[:tag_id]
      taggings = Tagging.where(tag_id: params[:tag_id])
      posts = posts.where(tagging_id: taggings)
    else
      params[:channel] ||= 'Everything'
      params[:sort] ||= 'Hot this week'

      if params[:channel]
        case params[:channel]
        when 'Everything'
        when 'Following'
          posts = posts.where(user_id: current_user.followed_users).references(:users)
        when 'My Channels'
          posts = posts.where(user_id: current_user.users_from_channels)
        else
          channel = Channel.find_by_name(params[:channel])
          posts = posts.where(user_id: channel.users)
        end
      end
    end

    case params[:sort]
    when 'Newest'
      posts = posts.order('created_at DESC')
    when 'Hot today'
      posts = posts.where('created_at >= ?', Time.now - 1.day).order('like_relationships_count DESC')
    when 'Hot this week', nil
      posts = posts.where('created_at >= ?', Time.now - 1.week).order('like_relationships_count DESC')
    when 'Hot this month'
      posts = posts.where('created_at >= ?', Time.now - 1.month).order('like_relationships_count DESC')
    when 'Hot all time'
      posts = posts.order('like_relationships_count DESC')
    end

    posts
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
