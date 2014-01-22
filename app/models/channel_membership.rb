class ChannelMembership < ActiveRecord::Base
  belongs_to :user, counter_cache: :channels_count
  belongs_to :channel, counter_cache: :users_count

  validates :user_id, :channel_id, presence: true
end
