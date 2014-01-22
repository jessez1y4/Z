class AddRandomPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :random_password, :boolean, null: false, default: false
  end
end
