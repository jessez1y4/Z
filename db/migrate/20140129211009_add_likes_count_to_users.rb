class AddLikesCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :likes_count, :integer, default: 0

    User.reset_column_information
    User.find_each do |u|
      likes_count = u.posts.inject(0) do |sum, post|
        sum + post.likes
      end

      User.update_counters u.id, likes_count: likes_count
    end
  end
end
