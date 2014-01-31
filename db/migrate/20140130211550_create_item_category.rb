class CreateItemCategory < ActiveRecord::Migration
  def change
    create_table :item_categories do |t|
      t.string :name
    end

    add_column :items, :item_category_id, :integer
  end
end
