class Meal < ApplicationRecord
  belongs_to :user, optional: true 
  has_many :meal_compositions
  has_many :foods, through: :meal_compositions


end
