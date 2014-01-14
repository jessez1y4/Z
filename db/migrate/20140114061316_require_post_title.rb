class RequirePostTitle < ActiveRecord::Migration
  def change
    change_column :posts, :title, :string, null: false
  end
end
