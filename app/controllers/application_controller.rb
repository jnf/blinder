class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate!
    if session[:user_id].nil?
      session[:request_url] = request.url if request.get?
      redirect_to '/auth/github'
    end
  end

  helper_method :current_user
end
