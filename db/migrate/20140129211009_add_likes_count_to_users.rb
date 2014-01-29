class AddLikesCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :likes_count, :integer, default: 0

    User.reset_column_information
    User.find_each do |u|
      User.update_counters u.id, likes_count: u.likes_count_old
    end
  end
end
