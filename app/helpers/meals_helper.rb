module MealsHelper

  def meal_time(meal)
    meal.time.strftime('%A, %b %d, %l:%M %p')
  end

  def div_tag_for_food_attributes(foods)
    content_tag :div, class: "field" do
      yield
    end
  end

  def div_tag_for_new_foods
    content_tag :div, class: "field" do
      yield
    end
  end


end
