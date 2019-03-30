class MealsController < ApplicationController
  before_action :authorized?
  before_action :find_meal, only: [:show, :edit, :update, :destroy]
  before_action :find_macronutrients, only: [:new, :create, :show, :update]

  def index
    @meals = current_user.meals
  end

  def new
    @foods = Food.all
    @meal = Meal.new
  end

  def create
    raise params.inspect 
    @meal = Meal.new(meal_params)
    @meal.user = current_user

    if @meal.save
      redirect_to user_path(current_user)
    else
      @foods = Food.all
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    raise params.inspect
    if @meal.update(meal_params)
      redirect_to meal_path(@meal)
    else
      render :show
    end
  end

  def destroy
    @meal.meal_compositions.each do |meal_composition|
      meal_composition.destroy
    end
    @meal.destroy
    redirect_to user_path(current_user), notice: "You just deleted a meal for #{@meal.time.strftime('%A, %b %d, %l:%M %p')}."
  end

  private

  def meal_params
    params.require(:meal).permit(:servings, :remove_food, :time, food_attributes: [:food_id, :servings], new_foods: [:food_name, :food_servings, macronutrient_categories: [:macronutrient_id, :grams]], add_food: [:food_id, :servings])
  end

  def find_meal
    @meal = Meal.find(params[:id])
  end

  def find_macronutrients
    @macronutrients = Macronutrient.all
  end

end
