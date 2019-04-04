class MealsController < ApplicationController
  before_action :authorized?
  before_action :find_meal, only: [:show, :edit, :update, :destroy]
  before_action :find_macronutrients, only: [:new, :create, :show, :update]

  def index
    @meals = current_user.meals
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @meals, status: 200 }
    end
  end

  def new
    @foods = Food.all
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user

    if @meal.save
      #redirect_to user_path(current_user)
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.json { render json: @meal, status: 201 }
      end
    else
      @foods = Food.all
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @meal, status: 200}
    end
  end

  def edit

  end

  def update
    @food = Food.find(params[:meal][:add_food][:food_id])
    if @meal.update(meal_params)
      respond_to do |format|
        format.html { redirect_to meal_path(@meal) }
        format.json { render json: {
          food: @food,
          food_servings: params[:meal][:add_food][:servings],
          table_data: NewTableDataService.new.call_meal(@meal)
           }
         }
       end
      #redirect_to meal_path(@meal)
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
