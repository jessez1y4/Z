class AddNumberAndXAndYToItems < ActiveRecord::Migration
  def change
    add_column :items, :number, :integer, null: false
    add_column :items, :x, :integer, null: false
    add_column :items, :y, :integer, null: false
  end
end
