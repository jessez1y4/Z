# This migration comes from acts_as_taggable_on_engine (originally 1)
class ActsAsTaggableOnMigration < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name, null: false, unique: true
    end

    create_table :taggings do |t|
      t.references :tag
      t.references :post
      t.datetime :created_at
    end

    add_index :taggings, :tag_id
    add_index :taggings, :post_id
  end

  def self.down
    drop_table :taggings
    drop_table :tags
  end
end
