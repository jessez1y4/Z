class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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
