class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :items, through: :posts
  has_many :sites
  has_many :comments, as: :commentable

  has_many :like_relationships
  has_many :liked_posts, source: :post, through: :like_relationships

  has_many :channel_memeberships
  has_many :channels, through: :channel_memeberships

  # follower_id    ---->   followed_id
  has_many :follow_relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :follow_relationships, source: :followed

  # followed_id    ---->   follower_id
  has_many :reverse_follow_relationships, foreign_key: "followed_id", class_name: "FollowRelationship", dependent: :destroy
  has_many :followers, through: :reverse_follow_relationships, source: :follower


  attr_accessor :login

  validates :username, :full_name, presence: true
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

  # follow/unfollow methods
  def following?(other_user)
    follow_relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    follow_relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    follow_relationships.find_by(followed_id: other_user.id).destroy
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
    @likes unless @likes.nil?
    if posts.empty?
      @likes = 0
    else
      @likes = self.posts.inject(0) do |sum, post|
        sum + post.likes
      end
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
