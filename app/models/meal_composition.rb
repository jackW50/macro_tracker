class MealComposition < ApplicationRecord
  belongs_to :meal
  belongs_to :food

  validates :food_servings, numericality: true 
end
