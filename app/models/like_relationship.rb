class LikeRelationship < ActiveRecord::Base
  belongs_to :user, counter_cache: :liked_posts_count
  belongs_to :post, counter_cache: true

  validates :user_id, :post_id, presence: true
end
