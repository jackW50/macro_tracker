class FoodComposition < ApplicationRecord
  belongs_to :food
  belongs_to :macronutrient

  validation :macronutrient_grams, presence: true 
end
