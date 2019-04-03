class MealCompositionSerializer < ActiveModel::Serializer
  attributes :food_servings, :food_name
  belongs_to :food

  def food_name
    food = Food.find(self.object.food_id)
    food.name
  end
end
