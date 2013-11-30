class AddAvatarCloudinaryIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_cloudinary_id, :string
  end
end
