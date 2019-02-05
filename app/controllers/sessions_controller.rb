class SessionsController < ApplicationController

  def welcome

  end

  def new

  end

  def create
    #raise params.inspect
    if user = User.find_by(username: params[:user][:username])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def destroy

  end
end
