class AddEverything < ActiveRecord::Migration
  def change
    # user
    add_column :users, :description, :string

    # post
    create_table :posts do |t|
      t.belongs_to :user
      t.string :name

      t.timestamps
    end
    add_index :posts, :user_id

    # item
    create_table :items do |t|
      t.belongs_to :post
      t.string :name
      t.string :link

      t.timestamps
    end
    add_index :items, :post_id

    # channel
    create_table :channels do |t|
      t.string :name

      t.timestamps
    end
    add_index :channels, :name, unique: true

    # comment
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.string :content

      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]

    # user links (fb, twitter, etc.)
    create_table :sites do |t|
      t.belongs_to :user
      t.string :name
      t.string :link
    end
    add_index :sites, :user_id

    # join table for likes
    create_table :likes, id: false do |t|
      t.integer :user_id
      t.integer :post_id
    end

    # join table for channels and users
    create_table :channels_users, id: false do |t|
      t.integer :channel_id
      t.integer :user_id
  end
end
