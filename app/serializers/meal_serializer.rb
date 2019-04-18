class MealSerializer < ActiveModel::Serializer
  attributes :id, :time, :todays_meal?, :calories, :user 
  has_many :meal_compositions

  def time
    time = self.object.time.strftime('@ %l:%M %p')
  end

  def todays_meal?
    self.object.time >= DateTime.now.midnight && self.object.time <= DateTime.now.midnight + 1
    #true or false if it is a meal for today
  end

  def calories
    self.object.calories
  end
end
