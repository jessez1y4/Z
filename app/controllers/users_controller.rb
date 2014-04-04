class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update]

  def show
    params[:sort] ||= 'New'
    @user = User.find_by!("username ILIKE ?", params[:id])
    @posts = @user.posts
                  .sort(params[:sort])
                  .page(params[:page])
                  .per(20)
    render 'posts/index' if request.xhr?
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if params[:cloudinary_data]
      preloaded = Cloudinary::PreloadedFile.new(params[:cloudinary_data])
      raise "Invalid upload signature" if !preloaded.valid?
      # @cloudinary_id = preloaded.identifier
      if @user.update_attributes(avatar_cloudinary_id: preloaded.identifier)
        redirect_to @user, notice: 'Avatar updated.'
      else
        #TODO
      end
    else
      params[:user].delete(:password) if params[:user][:password].blank?

      if @user.update_attributes(user_params)
        sign_in @user, bypass: true
        redirect_to @user, notice: 'Profile updated.'
      else
        render 'edit'
      end
    end
  end

  # def check_email_uniqueness
  #   @user = User.where("email ILIKE ?", params[:user][:email]).first

  #   respond_to do |format|
  #     format.json { render json: !@user }
  #   end
  # end

  # def check_username_uniqueness
  #   @user = User.where("username ILIKE ?", params[:user][:username]).first

  #   respond_to do |format|
  #     format.json { render json: !@user }
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:username, :email, :full_name, :description, :password, :random_password, :default_tag_list)
  end
end
