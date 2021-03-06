module FoodsHelper

  def food_errors_present?(food)
    if food.errors[:food_compositions].present?
      content_tag :p, class: "field_with_errors" do
        yield
      end
    else
      content_tag :p do
        yield
      end
    end
  end

  def food_grams?(food, macronutrient)
    if food.grams_of_macronutrient(macronutrient) == 0
      0
    else
      food.grams_of_macronutrient(macronutrient)
    end
  end

end
