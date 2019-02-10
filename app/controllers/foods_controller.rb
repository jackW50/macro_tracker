class FoodsController < ApplicationController

  def index
  end

  def new
    @meal = Meal.find(params[:meal_id])
    @food = Food.new
    @macronutrients = Macronutrient.all
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @food = Food.new(food_params)
    if @food.save
      @meal.meal_compositions.create(food_id: @food.id)
      redirect_to meal_path(@meal)
    else
      @macronutrients = Macronutrient.all
      render :new
      #redirect_to new_meal_food_path(@meal)
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @macronutrients = Macronutrient.all
    @food = Food.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:meal_id])
    @food = Food.find(params[:id])

    if @food.update(food_params)
      redirect_to food_path(@food)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def food_params
    params.require(:food).permit(:name, macronutrients_grams: [:id, :grams])
  end

end
