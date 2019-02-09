class MealsController < ApplicationController
  before_action :date_valid?, only: :create

  def index

  end

  def new
    @meal = Meal.new
    @macronutrients = Macronutrient.all
  end

  def create
    time = DateTime.new(params[:meal]["time(1i)"].to_i, params[:meal]["time(2i)"].to_i, params[:meal]["time(3i)"].to_i, params[:meal]["time(4i)"].to_i, params[:meal]["time(5i)"].to_i)
    @meal = Meal.new(food_attributes: params[:meal][:food_attributes], time: time, new_foods: params[:meal][:new_foods])
    if @meal.save
      #@meal.user = current_user
      redirect_to meal_path(@meal)
    else
      @macronutrients = Macronutrient.all
      render :new
    end
  end

  def show
    @meal = Meal.find(params[:id])
    @macronutrients = Macronutrient.all
  end

  def edit
    raise inspect 
    @meal = Meal.find(params[:id])
  end

  def update
    meal = Meal.find(params[:id])
    if params[:meal]["time(1i)"].present?
      time = DateTime.new(params[:meal]["time(1i)"].to_i, params[:meal]["time(2i)"].to_i, params[:meal]["time(3i)"].to_i, params[:meal]["time(4i)"].to_i, params[:meal]["time(5i)"].to_i)
      meal.update(time: time)
    else
      meal.update(meal_params)
    end
    redirect_to meal_path(meal)
  end

  def destroy
    Meal.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end

  private

  def date_valid?
    redirect_to new_meal_path, alert: "You must at least choose a month, day, and year for your meal" unless params[:meal]["time(1i)"].present? && params[:meal]["time(2i)"].present? && params[:meal]["time(3i)"].present?
  end

  def meal_params
    params.require(:meal).permit(:add_food, :remove_food, :time, :food_attributes, :new_foods)
  end

end
