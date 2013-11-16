class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :items, through: :posts
  has_many :sites
  has_many :comments, as: :commentable

  has_many :likes
  has_many :liked_posts, class_name: 'Post', through: :likes

  has_many :channel_memeberships
  has_many :channels, through: :channel_memeberships

  has_many :follows
  has_many :followers, through: :follows

  has_many :inverse_follows, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :followings, through: :inverse_follows, source: :user

  attr_accessor :login

  validates :username, presence: true
  validates :username, length: { minimum: 4, maximum: 15 }
  validates :username, format: { with: /\A\w+\z/, message: 'only accepts letters, numbers, and underscore' }

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  # like/unlike post methods
  def liked_post?(post)
    post.likes.include? self
  end

  def like_post(post)
    post.likes << self unless liked_post?(post)
  end

  def unlike_post(post)
    post.likes.destroy self if liked_post?(post)
  end

  # count of likes
  def likes
    @likes |= self.posts.inject(0) do |sum, post|
      sum + post.likes
    end
  end

  # channel methods
  def joined_channel?(channel)
    channel.users.include? self
  end

  def join_channel(channel)
    channel.users << self unless joined_channel?(channel)
  end

  def leave_channel(channel)
    channel.users.destroy self if joined_channel?(channel)
  end
end
