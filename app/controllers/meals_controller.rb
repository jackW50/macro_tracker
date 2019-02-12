class MealsController < ApplicationController

  def index
    @meals = current_user.meals
  end

  def new
    @foods = Food.all
    @meal = Meal.new
    @macronutrients = Macronutrient.all
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user

    if @meal.save
      redirect_to user_path(current_user)
    else
      @foods = Food.all
      @macronutrients = Macronutrient.all
      render :new
    end
  end

  def show
    @meal = Meal.find(params[:id])
    @macronutrients = Macronutrient.all
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    if @meal.update(meal_params)
      redirect_to meal_path(@meal)
    else
      render :edit
    end
  end

  def destroy
    meal = Meal.find(params[:id])
    meal.meal_compositions.each do |meal_composition|
      meal_composition.destroy
    end
    meal.destroy
    redirect_to user_path(current_user), notice: "You just deleted a meal for #{meal.time.strftime('%A, %b %d, %l:%M %p')}."
  end

  private

  def meal_params
    params.require(:meal).permit(:servings, :remove_food, :time, food_attributes: [:food_id, :servings], new_foods: [:food_name, :food_servings, macronutrient_categories: [:macronutrient_id, :grams]], add_food: [:food_id, :servings])
  end

end
