class Food < ApplicationRecord
  has_many :meal_compositions
  has_many :meals, through: :meal_compositions
  has_many :food_compositions
  has_many :macronutrients, through: :food_compositions

  validates :name, presence: true
  validates :name, uniqueness: true

  def calories_from_macronutrient(macronutrient)
    FoodComposition.total_calories_from_macro(self, macronutrient)
  end

  def percent_calories_macronutrient(macronutrient)
    (calories_from_macronutrient(macronutrient).to_f / calories * 100).round(2)
  end

  def grams_of_macronutrient(macronutrient)
    FoodComposition.total_grams_of_macronutrients_in_food(self, macronutrient)
  end

  def calories
    FoodComposition.total_calories(self)
  end

  def servings(meal)
    MealComposition.find_servings_of_food_in_meal(meal, self)
  end

  def macronutrients_grams=(macronutrients_grams)
    macronutrients_grams.each do |macronutrient_grams|
      food_composition = FoodComposition.find_by(food_id: self.id, macronutrient_id: macronutrient_grams[:id])
      macronutrient_grams[:grams] = 0 unless macronutrient_grams[:grams].present?
      if food_composition.nil? && macronutrient_grams[:id].present?
        self.food_compositions.build(macronutrient_id: macronutrient_grams[:id], macronutrient_grams: macronutrient_grams[:grams])
      else
        food_composition.update(macronutrient_grams: macronutrient_grams[:grams], macronutrient_id: macronutrient_grams[:id]) if macronutrient_grams[:id].present?
      end
    end
  end

end
