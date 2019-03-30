class UsersController < ApplicationController
  before_action :authorized?, only: :show

  def new
    already_logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @meals = Meal.today(current_user)
    @macronutrients = Macronutrient.all
  end

  def edit

  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
