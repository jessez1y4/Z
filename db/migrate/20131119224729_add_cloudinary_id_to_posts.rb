class AddCloudinaryIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :cloudinary_id, :string, null: false
  end
end
