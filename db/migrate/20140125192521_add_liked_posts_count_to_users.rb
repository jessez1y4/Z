class AddLikedPostsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :liked_posts_count, :integer, default: 0

    User.reset_column_information
    User.find_each do |u|
      User.update_counters u.id, liked_posts_count: u.like_relationships.count
    end
  end
end
