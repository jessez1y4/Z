class RenameChannelMembership < ActiveRecord::Migration
  def change
    rename_table :channel_memeberships, :channel_memberships
  end
end
