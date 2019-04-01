class MealSerializer < ActiveModel::Serializer
  attributes :id, :time
  has_many :foods
end
