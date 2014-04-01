class AddTypeToTags < ActiveRecord::Migration
  def change
    add_column :tags, :category, :integer, default: 0
  end
end
