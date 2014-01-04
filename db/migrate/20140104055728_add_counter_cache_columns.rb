class AddCounterCacheColumns < ActiveRecord::Migration
  def change
    add_column :users, :posts_count, :integer, :default => 0
    add_column :users, :followings_count, :integer, :default => 0
    add_column :users, :followers_count, :integer, :default => 0

    User.reset_column_information
    User.find(:all).each do |u|
      User.update_counters u.id, posts_count: u.posts.count, followings_count: u.followed_users.count, followers_count: u.followers.count
    end

    add_column :posts, :comments_count, :integer, :default => 0

    Post.reset_column_information
    Post.find(:all).each do |p|
      Post.update_counters p.id, comments_count: p.comments.count
    end
  end
end
