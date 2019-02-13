class FoodsController < ApplicationController
  before_action :authorized?
  before_action :find_meal, only: [:index, :new]
  before_action :find_macronutrients, only: [:new, :create, :edit, :update]
  before_action :find_food, only: [:show, :edit, :update, :destroy]

  def index
    #@meal = Meal.find(params[:meal_id])
  end

  def new
    #@meal = Meal.find(params[:meal_id])
    @food = Food.new
    #@macronutrients = Macronutrient.all
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @food = Food.new(food_params)
    associate_to_meal(@meal, @food, params[:food_servings])
    if @food.save
      redirect_to meal_path(@meal)
    else
      #@macronutrients = Macronutrient.all
      render :new
    end
  end

  def show
    #@food = Food.find(params[:id])
  end

  def edit
    #@macronutrients = Macronutrient.all
    #@food = Food.find(params[:id])
  end

  def update
    #@food = Food.find(params[:id])

    if @food.update(food_params)
      redirect_to food_path(@food)
    else
      #@macronutrients = Macronutrient.all
      render :edit
    end
  end

  def destroy
    #@food = Food.find(params[:id])
    @food.food_compositions.each do |f|
      f.destroy
    end
    @food.meal_compositions.each do |m|
      m.destroy
    end
    @food.destroy
    redirect_to user_path(current_user), notice: "You just deleted #{food.name} from database."
  end

  private

  def food_params
    params.require(:food).permit(:name, :food_servings, macronutrients_grams: [:id, :grams])
  end

  def associate_to_meal(meal, food, params_servings)
    params_servings = 1 unless params_servings.present?
    food.meal_compositions.build(meal_id: meal.id, food_servings: params_servings)
  end

  def find_meal
    @meal = Meal.find(params[:meal_id])
  end

  def find_macronutrients
    @macronutrients = Macronutrient.all
  end

  def find_food
    @food = Food.find(params[:id])
  end

end
