class MealComposition < ApplicationRecord
  belongs_to :meal
  belongs_to :food

  validates :food_servings, numericality: true

  scope :composition, ->(meal) { where('meal_compositions.meal_id = ?', meal.id) }

  def self.calories_for_each_food(meal)
    self.composition(meal).collect do |meal_comp|
      FoodComposition.total_calories(meal_comp.food) * meal_comp.food_servings
    end
  end

  def self.total_calories_in_meal(meal)
    self.calories_for_each_food(meal).sum
  end

  def self.calories_from_macro_for_each_food_in_meal(meal, macronutrient)
    self.composition(meal).collect do |meal_comp|
      FoodComposition.total_calories_from_macro(meal_comp.food, macronutrient) * meal_comp.food_servings
    end
  end

  def self.total_calorie_from_macro_in_meal(meal, macronutrient)
    self.calories_from_macro_for_each_food_in_meal(meal, macronutrient).sum
  end

  def self.grams_of_macro_for_each_food_in_meal(meal, macronutrient)
    self.composition(meal).collect do |meal_comp|
      FoodComposition.total_grams_of_macronutrients_in_food(meal_comp.food, macronutrient) * meal_comp.food_servings
    end
  end

  def self.total_grams_of_macro_in_meal(meal, macronutrient)
    self.grams_of_macro_for_each_food_in_meal(meal, macronutrient).sum
  end

  def self.find_grams_and_servings(meal)
    self.composition(meal).joins(food: :food_compositions).pluck('food_compositions.macronutrient_grams', 'meal_compositions.food_servings')
  end

  def self.collect_total_grams_of_each_food_in_meal(meal)
    self.find_grams_and_servings(meal).collect { |arr| arr[0] * arr[1] }
  end

  def self.total_grams_in_meal(meal)
    self.collect_total_grams_of_each_food_in_meal(meal).sum
  end

  def self.percent_of_macro_calories(meal, macronutrient)
    (self.total_calorie_from_macro_in_meal(meal, macronutrient).to_f / self.total_calories_in_meal(meal) * 100).round(2)
  end

  def self.percent_of_macro_grams(meal, macronutrient)
    (self.total_grams_of_macro_in_meal(meal, macronutrient).to_f / self.total_grams_in_meal(meal) * 100).round(2)
  end

end
