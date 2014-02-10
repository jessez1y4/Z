class AddChangedUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :changed_username, :boolean, default: false, null: false
  end
end
