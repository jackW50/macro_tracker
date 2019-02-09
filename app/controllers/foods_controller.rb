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
    @meal = Meal.find(params[:meal_id])
    @food = Food.find(params[:id])

    if @food.update(macronutrients_grams: params[:food][:macronutrients_grams])
      redirect_to meal_food_path(@meal, @food)
    else
      render :edit
    end
  end

  def destroy
  end 

  private

  def food_params
    params.require(:food).permit(:name, :macronutrient_ids, :macronutrients_grams[][:grams], :macronutrients_grams[][:name])
  end
end
