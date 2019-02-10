class FoodsController < ApplicationController

  def index
    @meal = Meal.find(params[:meal_id])
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
      #raise @food.inspect
      @meal.meal_compositions.create(food_id: @food.id)
      redirect_to meal_path(@meal)
    else
      @macronutrients = Macronutrient.all
      #raise @food.inspect
      render :new
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
    @food = Food.find(params[:id])

    if @food.update(food_params)
      redirect_to food_path(@food)
    else
      @macronutrients = Macronutrient.all
      render :edit
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.food_compositions.each do |f|
      f.destroy
    end
    food.meal_compositions.each do |m|
      m.destroy
    end
    food.destroy
    redirect_to user_path(current_user), notice: "You just deleted #{food.name} from database."
  end

  private

  def food_params
    params.require(:food).permit(:name, macronutrients_grams: [:id, :grams])
  end

end
