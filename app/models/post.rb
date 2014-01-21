class Post < ActiveRecord::Base
  belongs_to :user, counter_cache: true

  has_many :items, -> { order('number ASC') }
  has_many :comments, as: :commentable

  has_many :like_relationships, dependent: :destroy
  has_many :likers, source: :user, through: :like_relationships

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  accepts_nested_attributes_for :items, allow_destroy: true

  validates :title, presence: true

  # scope :page_with_counter_cache, lambda {|page_number, total_count_value|
  #   page(page_number).extending {
  #     # open scope to smuggle total_count
  #     define_method(:total_count) { total_count_value }
  #   }
  # }

  scope :newest, -> { order('posts.created_at DESC') }
  scope :hottest, -> { order('like_relationships_count DESC') }

  def self.recent(time)
    where('posts.created_at > ?', Time.now - time)
  end

  def self.sort(sort)
    case sort
    when 'New'
      newest
    when 'Hot today'
      recent(1.day).hottest
    when 'Hot this week', nil
      recent(1.day).hottest
    when 'Hot this month'
      recent(1.week).hottest
    when 'Hot'
      hottest
    end
  end

  def self.following(user)
    where(user_id: user.followed_users)
  end

  def self.from_my_channels(user)
    where(user_id: user.users_from_channels)
  end

  def self.from_channel(channel)
    where(user_id: channel.users)
  end

  def self.scope(scope_name, user)
    case scope_name
    when 'Everything'
      scoped
    when 'Following'
      following(user)
    else
      channel = Channel.find_by_name(scope_name)
      from_channel(channel)
    end
  end

  def likes
    like_relationships_count
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.upcase.split(",").reject{|s| s.blank?}.collect(&:strip).uniq.map do |n|
      Tag.where(name: n).first_or_create!
    end
  end
end
