class AddUsersCountToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :users_count, :integer, default: 0
  end
end
