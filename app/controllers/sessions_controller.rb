class SessionsController < ApplicationController
  def create
    user = User.check_from_omniauth(env["omniauth.auth"])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Signed In"
      redirect_to :back
    else
      flash[:notice] = "Not Authorized"
      redirect_to root_url
    end
  rescue ActionController::RedirectBackError
    store_location = session[:request_url]
    redirect_to( store_location || root_url )
  end

  def destroy
    session.delete :user_id
    redirect_to root_url
  end
end
