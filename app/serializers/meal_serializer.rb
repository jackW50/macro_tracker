class MealSerializer < ActiveModel::Serializer
  attributes :id, :time, :todays_meal?
  has_many :meal_compositions

  def time
    time = self.object.time.strftime('%A, %b %d, @ %l:%M %p')
  end

  def todays_meal?
    #true or false if it is a meal for today
  end
end
