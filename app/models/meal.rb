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
#"food_attributes"=>[{"food_id"=>"3", "servings"=>"2"}, {"food_id"=>"8", "servings"=>"3"}]
  def food_attributes=(food_attributes)
    #raise food_attributes.inspect
    food_attributes.each do |food_attribute|
      if food_attribute[:food_id].present?
        self.meal_compositions.build(food_id: food_attribute[:food_id], food_servings: food_attribute[:servings])
      end
    end
  end

  def new_foods=(new_foods)
    new_foods.each do |new_food|
      if !new_food[:food_name].blank?
        if food = Food.find_by(name: new_food[:food_name])
          self.meal_compositions.build(food_id: food.id, food_servings: new_food[:food_servings])
        else
          food = Food.create(name: new_food[:food_name])
            new_food[:macronutrient_categories].each do |macronutrient_category|
              food.food_compositions.build(food_id: food.id, macronutrient_id: macronutrient_category[:macronutrient_id], macronutrient_grams: macronutrient_category[:grams]) if macronutrient_category[:macronutrient_id].present?
            end
          self.meal_compositions.build(food_id: food.id, food_servings: new_food[:food_servings])
        end
      end
    end
  end

end
