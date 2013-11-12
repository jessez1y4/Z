class Channel < ActiveRecord::Base
  has_many :channel_memeberships
  has_many :users, through: :channel_memeberships
end