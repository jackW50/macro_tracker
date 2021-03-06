module MealsHelper

  def meal_errors_present?(meal)
    if meal.errors[:food_compositions].present? || meal.errors[:meal_compositions].present?
      content_tag :div, class: "field_with_errors" do
        yield
      end
    else
      div_tag_for_food_attributes do
        yield
      end
    end
  end

  def meal_time_link(meal, user)
    if user.nil?
      link_to meal_time(meal), meal_path(meal)
    else
      link_to meal_hour_min(meal), meal_path(meal), rel: "shortcut icon"
    end
  end

  def meal_time(meal)
    meal.time.strftime('%A, %b %d, @ %l:%M %p')
  end

  def meal_hour_min(meal)
    meal.time.strftime('%b %d, @ %l:%M %p')
  end

  def div_tag_for_food_attributes
    content_tag :div, class: "field" do
      yield
    end
  end

  def tr_class(index)
    if index.odd?
      content_tag :tr, class: "pure-table-odd" do
        yield
      end
    else
      content_tag :tr do
        yield
      end
    end
  end

end
