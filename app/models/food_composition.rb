class FoodComposition < ApplicationRecord
  belongs_to :food
  belongs_to :macronutrient

  validates :macronutrient_grams, presence: true 
end
