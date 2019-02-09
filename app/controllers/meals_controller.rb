class MealsController < ApplicationController
  before_action :check_date, only: :create

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

  end

  def update
    meal = Meal.find(params[:id])
    meal.update(meal_params)
    redirect_to meal_path(meal)
  end

  def destroy

  end

  private

  def check_date
    redirect_to new_meal_path, alert: "You must at least choose a month, day, and year for your meal" unless params[:meal]["time(1i)"].present? && params[:meal]["time(2i)"].present? && params[:meal]["time(3i)"].present?
  end

  def meal_params
    params.require(:meal).permit(:add_food, :remove_food, :time, :food_attributes, :new_foods)
  end

end
