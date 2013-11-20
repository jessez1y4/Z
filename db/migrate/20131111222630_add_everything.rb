class AddEverything < ActiveRecord::Migration
  def change
    # user
    add_column :users, :description, :string

    # post
    create_table :posts do |t|
      t.belongs_to :user, null: false
      t.string :name # null: true allows 2 step creation of a post

      t.timestamps
    end
    add_index :posts, :user_id

    # item
    create_table :items do |t|
      t.belongs_to :post, null: false
      t.string :name, null: false
      t.string :link

      t.timestamps
    end
    add_index :items, :post_id

    # channel
    create_table :channels do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :channels, :name, unique: true

    # comment
    create_table :comments do |t|
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false
      t.string :content, null: false

      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]

    # user links (fb, twitter, etc.)
    create_table :sites do |t|
      t.belongs_to :user, null: false
      t.string :name, null: false
      t.string :link, null: false
    end
    add_index :sites, :user_id

    # join table for likes
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
    end

    # join table for channels and users
    create_table :channel_memeberships do |t|
      t.integer :channel_id, null: false
      t.integer :user_id, null: false
    end
  end
end
