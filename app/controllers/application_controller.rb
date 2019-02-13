class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  end

  def logged_in?
    !!current_user
  end

  def authorized?
    redirect_to root_path unless logged_in?
  end

  helper_method :current_user
  helper_method :logged_in?
end
