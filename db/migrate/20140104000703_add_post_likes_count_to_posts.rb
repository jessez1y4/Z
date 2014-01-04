class AddPostLikesCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_likes_count, :integer, :default => 0

    Post.reset_column_information
    Post.find(:all).each do |p|
      Post.update_counters p.id, :post_likes_count => p.like_relationships.count
    end
  end
end
