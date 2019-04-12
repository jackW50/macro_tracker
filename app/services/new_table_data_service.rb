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

  def call_todays_meals
  end 

end
