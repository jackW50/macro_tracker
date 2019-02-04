class Macronutrient < ApplicationRecord
  has_many :food_compositions
  has_many :foods, through: :food_compositions
  
end
