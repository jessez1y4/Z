class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    @user = User.find_for_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = "You are signed in through #{@user.provider.titleize}."
      sign_in_and_redirect @user
    else
      session['devise.omniauth_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  alias_method :facebook, :all
  alias_method :google_oauth2, :all
end
