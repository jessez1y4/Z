class AddChannelAllowanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :channel_allowance, :integer, null: false, default: 1
  end
end
