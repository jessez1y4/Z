class CreateShortcuttingsAndDefaultTaggins < ActiveRecord::Migration
  def change
    create_table :bookmarkings do |t|
      t.references :tag
      t.references :user
    end

    create_table :default_taggings do |t|
      t.references :tag
      t.references :user
    end
  end
end
