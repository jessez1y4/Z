class AddCounterCacheForTags < ActiveRecord::Migration
  def change
    add_column :posts, :tags_count, :integer, :default => 0
    add_column :tags, :posts_count, :integer, :default => 0

    Post.reset_column_information
    Post.find(:all).each do |p|
      Post.update_counters p.id, tags_count: p.tags.count
    end

    Tag.reset_column_information
    Tag.find(:all).each do |t|
      Tag.update_counters t.id, posts_count: t.posts.count
    end
  end
end
