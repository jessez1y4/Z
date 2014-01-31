class LikeRelationship < ActiveRecord::Base
  after_create :increment_counters
  after_destroy :decrement_counters

  belongs_to :user, counter_cache: :liked_posts_count
  belongs_to :post, counter_cache: true

  validates :user_id, :post_id, presence: true

  private

  def increment_counters
    User.increment_counter 'likes_count', post.user.id
  end

  def decrement_counters
    User.decrement_counter 'likes_count', post.user.id
  end
end
