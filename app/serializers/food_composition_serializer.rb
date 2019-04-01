class FoodCompositionSerializer < ActiveModel::Serializer
  attributes :id, :macronutrient_grams, :macronutrient
end
