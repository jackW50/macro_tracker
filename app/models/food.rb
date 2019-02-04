class Food < ApplicationRecord
  has_many :meal_compositions
  has_many :meals, through: :meal_compositions
  has_many :food_compositions
  has_many :macronutrients, through: :food_compositions

  validates :name, presence: true
  validates :name, uniquesness: true 
end
