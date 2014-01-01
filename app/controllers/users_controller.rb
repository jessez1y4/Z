class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    preloaded = Cloudinary::PreloadedFile.new(params[:cloudinary_data])
    raise "Invalid upload signature" if !preloaded.valid?
    # @cloudinary_id = preloaded.identifier
    if current_user.update_attributes(avatar_cloudinary_id: preloaded.identifier)
      redirect_to current_user, notice: 'Settings updated.'
    else
      #TODO
    end
  end

  def check_email_uniqueness
    @user = User.where("email ILIKE ?", params[:user][:email]).first

    respond_to do |format|
      format.json { render json: !@user }
    end
  end

  def check_username_uniqueness
    @user = User.where("username ILIKE ?", params[:user][:username]).first

    respond_to do |format|
      format.json { render json: !@user }
    end
  end
end
