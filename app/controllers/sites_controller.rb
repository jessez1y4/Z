class SitesController < ApplicationController
  before_filter :authenticate_user!

  def update
    @user = current_user
    p site_params
    if @user.site.update_attributes site_params
      redirect_to @user, notice: 'Personal pages updated.'
    else
      render 'users/edit'
    end
  end

  private

  def site_params
    params.require(:site).permit(:facebook, :twitter, :google, :weibo, :blog)
  end
end
