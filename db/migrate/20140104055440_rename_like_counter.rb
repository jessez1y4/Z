class RenameLikeCounter < ActiveRecord::Migration
  def change
    rename_column :posts, :post_likes_count, :like_relationships_count
  end
end
