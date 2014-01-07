class Channel < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_many :channel_memberships
  has_many :users, through: :channel_memberships
  has_many :posts, through: :users
  has_many :like_relationships, through: :posts

  validates :name, presence: true
end
