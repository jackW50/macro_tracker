class SessionsController < ApplicationController

  def new
    already_logged_in?
  end

  def create
    if auth.present?
      @user = User.find_or_create_by_auth(auth)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif @user = User.find_by(username: params[:user][:username]) 
      authentification?(@user, params[:user][:password])
    else
      redirect_to new_session_path, alert: "Invalid username"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def authentification?(user, password)
    if user.authenticate(password)
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to new_session_path, alert: "Invalid password"
    end
  end

end
