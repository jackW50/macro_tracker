class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :food_compositions
end
