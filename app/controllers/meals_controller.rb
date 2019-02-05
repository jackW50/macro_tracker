class MealsController < ApplicationController

  def index

  end

  def new

  end

  def create

  end

  def show
    raise params.inspect 
    @meal = Meal.find(params[:meal_id])
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
