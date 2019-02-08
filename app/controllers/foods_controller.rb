class FoodsController < ApplicationController

  def index
  end 

  def show
    @food = Food.find(params[:id])
    @meal = Meal.find(params[:meal_id]) if params[:meal_id].present?
  end

  def edit
  end
end
