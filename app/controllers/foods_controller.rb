class FoodsController < ApplicationController

  def index
  end

  def new
  end

  def show
    @food = Food.find(params[:id])
    @meal = Meal.find(params[:meal_id]) if params[:meal_id].present?
  end

  def edit
    @food = Food.find(params[:id])
    @meal = Meal.find(params[:meal_id]) if params[:meal_id].present?
  end

  def update
    #raise params.inspect
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:id])
    food.macronutrient_ids = params[:food][:macronutrient_ids]
    redirect_to meal_food_path(meal, food)
  end

  private

  def food_params
    params.require(:food).permit(:name, :macronutrient_ids)
  end
end
