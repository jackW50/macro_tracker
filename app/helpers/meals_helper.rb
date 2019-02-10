module MealsHelper

  def meal_time(meal)
    meal.time.strftime('%A, %b %d, %l:%M %p')
  end

  def new_meal_form(meal)
    form_for(meal) do |f|
      f.datetime_select :time
      yield
      f.submit
    end
  end

end
