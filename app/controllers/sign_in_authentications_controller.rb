class SignInAuthenticationsController < ApplicationController
  before_filter :authenticate_user!

  def destroy
    @sign_in_auth = SignInAuthentication.find(params[:id])
    @sign_in_auth.destroy!

    respond_to do |format|
      format.html { redirect_to edit_user_url }
      format.js
    end
  end
end
