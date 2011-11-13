class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all
  end

  def create
   auth = request.env["omniauth.auth"].to_yaml
   current_user.authentications.create(:provider => auth['provider'], :uid => auth['uid'])
   redirect_to authentications_url, :notice => "Authentication successful"
    end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
