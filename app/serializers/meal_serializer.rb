class MealSerializer < ActiveModel::Serializer
  attributes :id, :time, :meal_compositions
end
