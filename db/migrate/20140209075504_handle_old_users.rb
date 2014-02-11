class HandleOldUsers < ActiveRecord::Migration
  def change
    add_column :users, :changed_username, :boolean, default: false, null: false

    User.find_each(&:save!)

    User.find_each do |u|
      u.changed_username = false
      u.save!
    end
  end
end
