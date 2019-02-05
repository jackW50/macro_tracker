class Macronutrient < ApplicationRecord
  has_many :food_compositions
  has_many :foods, through: :food_compositions

  def grams(food)
    FoodComposition.total_grams_of_macro(food, self)
  end

  def calories(food)
    FoodComposition.total_calories_from_macro(food, self)
  end 
end
