class MealSerializer < ActiveModel::Serializer
  attributes :id, :time
  has_many :meal_compositions
end
