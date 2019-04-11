class MealSerializer < ActiveModel::Serializer
  attributes :id, :time
  has_many :meal_compositions

  def time
    time = self.object.time.strftime('%A, %b %d, @ %l:%M %p')
  end
end
