class AddDescriptionAndIsCreatorToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :description, :string
    add_column :channels, :is_creator, :boolean, null: false
  end
end
