class AddCropStrToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :crop_str, :string
  end
end
