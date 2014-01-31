class CreateItemCategoryTypes < ActiveRecord::Migration
  def change
    create_table :item_category_types do |t|
      t.string :name
    end

    add_column :item_categories, :item_category_type_id, :integer
  end
end
