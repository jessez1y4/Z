class AddSlugToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string
    add_index :posts, :slug

    Post.find_each(&:save!)
  end
end
