class CreateSites < ActiveRecord::Migration
  def change
    drop_table :sites

    create_table :sites do |t|
      t.integer :user_id
      t.string :facebook
      t.string :twitter
      t.string :google
      t.string :weibo
      t.string :blog
    end

    add_index :sites, :user_id
  end
end
