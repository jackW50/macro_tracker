class Meal < ApplicationRecord
  belongs_to :user, optional: true
  has_many :meal_compositions
  has_many :foods, through: :meal_compositions

  validates :time, presence: true

  scope :today, ->(user) { where("time >= :begin_day AND time <= :end_day AND user_id = :user_arg ", begin_day: DateTime.now.midnight, end_day: DateTime.now.midnight + 1, user_arg: user.id).order(time: :asc) }

  def self.calories_todays_meals(user)
    Meal.today(user).collect { |meal| MealComposition.total_calories_in_meal(meal) }.sum
  end

  def self.todays_macronutrient_total(user, macronutrient)
    Meal.today(user).collect { |meal| meal.grams_of_macronutrient(macronutrient) }.sum
  end

  def self.todays_macronutrient_calories(user, macronutrient)
    if macronutrient.category != "fat"
      Meal.todays_macronutrient_total(user, macronutrient) * 4
    else
      Meal.todays_macronutrient_total(user, macronutrient) * 9
    end
  end

  def self.todays_percent_calories_of_macro(user, macronutrient)
    (Meal.todays_macronutrient_calories(user, macronutrient).to_f / Meal.calories_todays_meals(user) * 100).round(2)
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
    self.meal_compositions.build(food_id: add_food[:food_id], food_servings: add_food[:servings])
  end

  def remove_food=(meal_composition)
    MealComposition.find(meal_composition).destroy
  end

  def food_attributes=(food_attributes)
    food_attributes.each do |food_attribute|
      if food_attribute[:food_id].present?
        food_attribute[:servings] = 1 unless food_attribute[:servings].present?
        self.meal_compositions.build(food_id: food_attribute[:food_id], food_servings: food_attribute[:servings])
      end
    end
  end

  def new_foods=(new_foods)
    new_foods.each do |new_food|
      new_food[:food_servings] = 1 unless new_food[:food_servings].present?
      if new_food[:food_name].present?
        find_or_create_food(food_name: new_food[:food_name], food_servings: new_food[:food_servings], attributes: new_food[:macronutrient_categories])
      end
    end
  end

  def find_or_create_food(food_name:, food_servings:, attributes:)
    if food = Food.find_by(name: food_name)
      self.meal_compositions.build(food_id: food.id, food_servings: food_servings)
    else
      food = Food.create(name: food_name)
      assign_food_composition(attributes: attributes, food: food)
      food.save
      self.meal_compositions.build(food_id: food.id, food_servings: food_servings)
    end
  end

  def assign_food_composition(attributes:, food:)
    attributes.each do |attribute|
      attribute[:grams] = 0 unless attribute[:grams].present?
      food.food_compositions.build(food_id: food.id, macronutrient_id: attribute[:macronutrient_id], macronutrient_grams: attribute[:grams]) if attribute[:macronutrient_id].present?
    end
  end

end
