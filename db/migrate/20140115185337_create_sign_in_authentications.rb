class CreateSignInAuthentications < ActiveRecord::Migration
  def change
    create_table :sign_in_authentications do |t|
      t.integer :user_id, null: false
      t.string :provider, null: false
      t.string :uid, null: false
    end

    add_index :sign_in_authentications, :user_id

    remove_column :users, :provider
    remove_column :users, :uid
  end
end
