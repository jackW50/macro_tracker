class MealCompositionSerializer < ActiveModel::Serializer
  attributes :id, :food_servings, :food_name, :food_id, :meal_id
  belongs_to :food

  def food_name
    food = Food.find(self.object.food_id)
    food.name
  end

end
