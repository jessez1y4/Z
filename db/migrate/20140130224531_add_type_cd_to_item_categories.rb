class AddTypeCdToItemCategories < ActiveRecord::Migration
  def change
    add_column :item_categories, :type_cd, :integer
  end
end
