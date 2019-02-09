class MealsController < ApplicationController

  def index

  end

  def new

  end

  def create

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

  def meal_params
    params.require(:meal).permit(:add_food, :remove_food)
  end

end
