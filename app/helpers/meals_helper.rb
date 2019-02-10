module MealsHelper

  def meal_time(meal)
    meal.time.strftime('%A, %b %d, %l:%M %p')
  end 
end
