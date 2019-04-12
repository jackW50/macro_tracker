class NewTableDataService

  def initialize
    @carbohydrate =  Macronutrient.find_by(category: "carbohydrate")
    @protein = Macronutrient.find_by(category: "protein")
    @fat = Macronutrient.find_by(category: "fat")
  end

  def call_meal(meal)
    {
      carbohydrate: meal.grams_of_macronutrient(@carbohydrate),
      percent_calories_of_carbohydrate: meal.percent_calories_macronutrient(@carbohydrate),
      protein: meal.grams_of_macronutrient(@protein),
      percent_calories_of_protein: meal.percent_calories_macronutrient(@protein),
      fat: meal.grams_of_macronutrient(@fat),
      percent_calories_of_fat: meal.percent_calories_macronutrient(@fat)
    }
  end

  def call_todays_meals(user)
    {
      carbohydrate: Meal.todays_macronutrient_total(user, @carbohydrate),
      percent_calories_of_carbohydrate: Meal.todays_percent_calories_of_macro(user, @carbohydrate),
      protein: Meal.todays_macronutrient_total(user, @protein),
      percent_calories_of_protein: Meal.todays_percent_calories_of_macro(user, @protein),
      fat: Meal.todays_macronutrient_total(user, @fat),
      percent_calories_of_fat: Meal.todays_percent_calories_of_macro(user, @fat)
    }
  end

end
