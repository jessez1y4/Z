class AddDefaultAvatar < ActiveRecord::Migration
  def change
    change_column :users, :avatar_cloudinary_id, :string, nil: false, default: 'v1390343618/default_profile_4_reasonably_small_nt1wg6.png'

    User.find_each do |u|
      if u.avatar_cloudinary_id.nil?
        u.avatar_cloudinary_id = 'v1390343618/default_profile_4_reasonably_small_nt1wg6.png'
        u.save!
      end
    end
  end
end
