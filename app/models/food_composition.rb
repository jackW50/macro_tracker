class FoodComposition < ApplicationRecord
  belongs_to :food
  belongs_to :macronutrient

  validates :macronutrient_grams, presence: true

  scope :total_grams_of_macro, ->(food, macronutrient) { where('food_compositions.food_id = ? AND food_compositions.macronutrient_id = ?', food.id, macronutrient.id).pluck(:grams).first }

  def self.total_calories_from_macro(food, macronutrient)
    total_grams_of_macro(food, macronutrient) * macronutrient.calories_per_gram
  end

  def self.total_calories(food)
    food.macronutrients.collect {|macro| self.total_calories_from_macro(food, macro) }.sum
  end
  
end
