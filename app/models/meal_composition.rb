class MealComposition < ApplicationRecord
  belongs_to :meal
  belongs_to :food

  validates :food_servings, numericality: true

  scope :composition, ->(meal) { where('meal_compositions.meal_id = ?', meal.id) }

  def self.calories_for_each_food(meal)
    self.composition(meal).collect do |meal_comp|
      FoodComposition.total_calories(meal_comp.food) * meal_comp.servings
    end
  end

  def self.total_calories_in_meal(meal)
    self.calories_for_each_food(meal).sum
  end

  def self.calories_from_macro_for_each_food_in_meal(meal, macronutrient)
    self.composition(meal).collect do |meal_comp|
      FoodComposition.total_calories_from_macro(meal_comp.food, macronutrient) * meal_comp.servings
    end
  end

  def self.total_calorie_from_macro_in_meal(meal, macronutrient)
    self.calories_from_macro_for_each_food_in_meal(meal, macronutrient).sum
  end

  def self.grams_of_macro_for_each_food_in_meal(meal, macronutrient)
    self.composition(meal).collect do |meal_comp|
      FoodComposition.total_grams_of_macro(meal_comp.food, macronutrient) * meal_comp.servings
    end
  end

  def self.total_grams_of_macro_in_meal(meal, macronutrient)
    self.grams_of_macro_for_each_food_in_meal(meal, macronutrient).sum
  end

end
