class ApplicationController < ActionController::Base

  helper

  def current_user
    @current_user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  end

  def logged_in?
    !!current_user
  end

  helper_method :current_user
end
