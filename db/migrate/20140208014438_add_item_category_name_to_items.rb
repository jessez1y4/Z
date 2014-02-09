class AddItemCategoryNameToItems < ActiveRecord::Migration
  def change
    add_column :items, :item_category_name, :string

    Item.find_each do |item|
      item.item_category_name = item.item_category.name
      item.save!
    end
  end
end
