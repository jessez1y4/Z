class ChangeIsCreator < ActiveRecord::Migration
  def change
    remove_column :channels, :is_creator
    add_column :channels, :creator_id, :integer
  end
end
