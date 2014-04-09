class User < ActiveRecord::Base
  acts_as_messageable

  before_validation :generate_username
  before_update :changed_password_check
  before_update :changed_username_check
  after_create :add_college_to_default_tags
  after_create :create_site

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google]

  has_one :site

  has_many :posts, dependent: :destroy
  has_many :items, through: :posts

  has_many :exhibit_posts,
           -> { exhibit },
           class_name: 'Post'

  has_many :comments, as: :commentable

  has_many :like_relationships, dependent: :destroy
  has_many :liked_posts,
           source: :post,
           through: :like_relationships

  has_many :channel_memberships, dependent: :destroy
  has_many :channels, through: :channel_memberships
  has_many :users_from_channels,
           -> { uniq },
           source: :users,
           through: :channels

  has_many :created_channels,
           class_name: 'Channel',
           foreign_key: 'creator_id'

  # follower_id    ---->   followed_id
  has_many :follow_relationships,
           foreign_key: "follower_id",
           dependent: :destroy
  has_many :followed_users,
           through: :follow_relationships,
           source: :followed

  # followed_id    ---->   follower_id
  has_many :reverse_follow_relationships,
           foreign_key: "followed_id",
           class_name: "FollowRelationship",
           dependent: :destroy
  has_many :followers,
           through: :reverse_follow_relationships,
           source: :follower

  has_many :sign_in_authentications, dependent: :destroy

  has_many :bookmarkings, dependent: :destroy
  has_many :bookmarks, source: :tag, through: :bookmarkings

  has_many :default_taggings, dependent: :destroy
  has_many :default_tags, source: :tag, through: :default_taggings

  accepts_nested_attributes_for :sign_in_authentications, allow_destroy: true

  validates :full_name, presence: true
  validates :username,
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 30, allow_nil: true },
            format: { with: /\A\w+\z/, message: 'only accepts letters, numbers, and underscore', allow_nil: true }

  scope :star, -> { order('likes_count DESC, posts_count DESC') }

  # def self.find_first_by_auth_conditions(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #   else
  #     where(conditions).first
  #   end
  # end

  def self.exclude(users)
    where.not(id: users)
  end

  def name
    full_name
  end

  def city
    self[:city].present? ? self[:city] : 'classified'
  end

  # follow/unfollow methods
  def following?(other_user)
    follow_relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    follow_relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    follow_relationships.find_by(followed_id: other_user.id).destroy!
  end

  # like/unlike post methods
  def liked?(post)
    post.likes.include? self
  end

  def like!(post)
    like_relationships.create!(post_id: post.id)
  end

  def unlike!(post)
    like_relationships.find_by(post_id: post.id).destroy!
  end

  def bookmark!(tag)
    bookmarkings.create!(tag_id: tag.id)
  end

  def unbookmark!(tag)
    bookmarkings.find_by(tag_id: tag.id).destroy!
  end

  # channel methods
  def joined_channel?(channel)
    channel.users.include? self
  end

  def join!(channel)
    channel_memberships.create!(channel_id: channel.id)
  end

  def leave!(channel)
    channel_memberships.find_by(channel_id: channel.id).destroy!
  end

  # google/facebook log in
  def self.create_from_omniauth(auth)
    create! do |user|
      sign_in_auth = user.sign_in_authentications.new
      sign_in_auth.provider = auth.provider
      sign_in_auth.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.random_password = true
      user.full_name = auth.info.name.titleize
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.omniauth_data'] && session['devise.omniauth_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
        user.full_name = data['name'] if user.full_name.blank?
      end
    end
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def password_required
    super && provider.blank?
  end

  def default_tag_list
    default_tags.map(&:name).join(", ")
  end

  def default_tag_list=(names)
    self.default_tags = names.upcase.split(",").reject{|s| s.blank?}.collect(&:strip).uniq.map do |n|
      Tag.where(name: n).first_or_create!
    end
  end

  def views_count
    @views_count ||= if posts.empty?
      0
    else
      self.posts.inject(0) do |sum, post|
        sum + post.views_count
      end
    end
  end

  def unread_msg_count
    @unread_count ||= mailbox.inbox(read: false).count(:id, distinct: true).to_s
  end

  def to_param
    username
  end

  private

  def add_college_to_default_tags
    if college.present?
      tag = Tag.where(name: college.upcase.strip).first_or_create
      default_taggings.create(user_id: id, tag_id: tag.id)
    end
  end

  def create_site
    Site.create(user_id: id)
  end

  def generate_username
    if username.nil?
      self.username = neat_username = full_name.parameterize(sep = '_')
      self.username = "#{neat_username}_#{SecureRandom.urlsafe_base64 3}" while User.where('username ILIKE ?', username).exists? || username.blank?
    end
  end

  def changed_password_check
    self.random_password = false if encrypted_password_changed?
    true
  end

  def changed_username_check
    self.changed_username = true if username_changed?
    true
  end
end
