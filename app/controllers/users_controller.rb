class UsersController < ApplicationController

  def new
    @user = User.new 
  end

  def create

  end

  def show
    @meals = current_user.meals
  end

  def edit

  end

  def update

  end

end
