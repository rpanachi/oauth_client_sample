class Users::OmniauthCallbacksController < ApplicationController

  def oauth
    @user = User.from_omniauth(auth_parameters)
    sign_in_and_redirect @user, :event => :authentication
  end

  private

  def auth_parameters
    auth = ActionController::Parameters.new(request.env["omniauth.auth"])
    auth.permit!
  end

end
