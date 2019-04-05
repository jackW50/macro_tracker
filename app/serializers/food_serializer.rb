class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name
  #has_many :meal_compositions
end
