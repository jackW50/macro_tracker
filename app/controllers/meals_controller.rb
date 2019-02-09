class MealsController < ApplicationController

  def index

  end

  def new
    @meal = Meal.new
    @macronutrients = Macronutrient.all
    @meal_composition = MealComposition.new
    @food = Food.new
    @food_composition = FoodComposition.new
  end

  def create
    raise params.inspect
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
