class FoodComposition < ApplicationRecord
  belongs_to :food
  belongs_to :macronutrient

  validates :macronutrient_grams, presence: true

  scope :food_macros, ->(food, macronutrient) { where('food_compositions.food_id = ? AND food_compositions.macronutrient_id = ?', food.id, macronutrient.id) }

  def self.total_calories_from_macro(food, macronutrient)
    total_grams_of_macronutrients_in_food(food, macronutrient) * macronutrient.calories_per_gram
  end

  def self.total_calories(food)
    food.macronutrients.collect { |macro| self.total_calories_from_macro(food, macro) }.sum
  end

  def self.total_grams_of_macronutrients_in_food(food, macronutrient)
    if self.food_macros(food, macronutrient).present?
      self.food_macros(food, macronutrient).pluck(:macronutrient_grams).first
    else
      0
    end
  end

end
