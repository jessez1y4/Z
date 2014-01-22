class PasswordsController < Devise::PasswordsController
  def update
    super
    if current_user.random_password?
      current_user.random_password = false
      current_user.save!
    end
  end
end
