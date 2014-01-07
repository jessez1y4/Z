class Channel < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_many :channel_memberships
  has_many :users, through: :channel_memberships

  validates :name, presence: true
end
