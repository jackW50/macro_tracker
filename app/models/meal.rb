class Meal < ApplicationRecord
  belongs_to :user, optional: true
  has_many :meal_compositions
  has_many :foods, through: :meal_compositions

  scope :today, -> { where("time > :begin_day AND time < :end_day", begin_day: DateTime.now.midnight, end_day: DateTime.now.midnight + 1) }
  scope :chronological, -> { order(time: :asc) }


  def self.find_user_meals_today(user)
    self.today.where(user: user.id)
  end

  def self.calories_todays_meals(user)
    find_user_meals_today(user).collect { |meal| MealComposition.total_calories_in_meal(meal) }
  end

  def calories
    MealComposition.total_calories_in_meal(self)
  end

  def calories_from_macronutrient(macronutrient)
    MealComposition.total_calorie_from_macro_in_meal(self, macronutrient)
  end

  def percent_calories_macronutrient(macronutrient)
    (calories_from_macronutrient(macronutrient).to_f / calories * 100).round(2)
  end

  def grams_of_macronutrient(macronutrient)
    MealComposition.total_grams_of_macro_in_meal(self, macronutrient)
  end

  def add_food=(add_food)
    self.meal_compositions.build(food_id: add_food)
  end

  def remove_food=(remove_food)
    MealComposition.find_by(food_id: remove_food, meal_id: self.id).destroy
  end

  def food_attributes=(food_attributes)
    raise food_attributes.inspect
    food_attributes.each do |food_attribute|
      if food_attribute[:food_id].present?
        self.meal_compositions.build(food_id: food_attribute[:food_id], servings: food_attribute[:servings])
      end
    end
  end

  def new_foods=(new_foods)
    raise new_foods.inspect 
  end

end
