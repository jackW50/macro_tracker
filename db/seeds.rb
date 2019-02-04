# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: "Todd_")
User.create(username: "Mary_")
User.create(username: "Joe_")
#10 meals
Meal.create(time: DateTime.now)
Meal.create(time: DateTime.new(2001, 2, 3))
Meal.create(time: DateTime.new(2002, 2, 3))
Meal.create(time: DateTime.commercial(2001))
Meal.create(time: DateTime.commercial(2002))
Meal.create(time: DateTime.commercial(2003))
Meal.create(time: DateTime.commercial(2004))
Meal.create(time: DateTime.commercial(2005))
Meal.create(time: DateTime.new(2003, 3, 2))
Meal.create(time: DateTime.new(2004, 1, 6))

#20 foods
Food.create(name: "orange")
Food.create(name: "apple")
Food.create(name: "potato")
Food.create(name: "canned corn")
Food.create(name: "hershey bar")
Food.create(name: "pasta")
Food.create(name: "sushi")
Food.create(name: "bread")
Food.create(name: "soup")
Food.create(name: "egg")
Food.create(name: "steak")
Food.create(name: "chicken")
Food.create(name: "onion")
Food.create(name: "plum")
Food.create(name: "tomato")
Food.create(name: "chips")
Food.create(name: "snickers")
Food.create(name: "pizza")
Food.create(name: "spaghetti")
Food.create(name: "ice cream")

Macronutrient.create(category: "carbohydrate", calories_per_gram: 4)
Macronutrient.create(category: "protein", calories_per_gram: 4)
Macronutrient.create(category: "fat", calories_per_gram: 9)

#12 foods composed
FoodComposition.create(macronutrient_id: 1, food_id: 1, grams: 12)
FoodComposition.create(macronutrient_id: 2, food_id: 1, grams: 2)
FoodComposition.create(macronutrient_id: 3, food_id: 1, grams: 1)

FoodComposition.create(macronutrient_id: 1, food_id: 2, grams: 16)
FoodComposition.create(macronutrient_id: 2, food_id: 2, grams: 5)
FoodComposition.create(macronutrient_id: 3, food_id: 2, grams: 4)

FoodComposition.create(macronutrient_id: 1, food_id: 3, grams: 10)
FoodComposition.create(macronutrient_id: 2, food_id: 3, grams: 5)
FoodComposition.create(macronutrient_id: 3, food_id: 3, grams: 2)

FoodComposition.create(macronutrient_id: 1, food_id: 4, grams: 5)
FoodComposition.create(macronutrient_id: 2, food_id: 4, grams: 1)
FoodComposition.create(macronutrient_id: 3, food_id: 4, grams: 15)

FoodComposition.create(macronutrient_id: 1, food_id: 5, grams: 25)
FoodComposition.create(macronutrient_id: 2, food_id: 5, grams: 2)
FoodComposition.create(macronutrient_id: 3, food_id: 5, grams: 3)

FoodComposition.create(macronutrient_id: 1, food_id: 6, grams: 12)
FoodComposition.create(macronutrient_id: 2, food_id: 6, grams: 5)
FoodComposition.create(macronutrient_id: 3, food_id: 6, grams: 15)

FoodComposition.create(macronutrient_id: 1, food_id: 7, grams: 3)
FoodComposition.create(macronutrient_id: 2, food_id: 7, grams: 25)
FoodComposition.create(macronutrient_id: 3, food_id: 7, grams: 10)

FoodComposition.create(macronutrient_id: 1, food_id: 8, grams: 12)
FoodComposition.create(macronutrient_id: 2, food_id: 8, grams: 1)
FoodComposition.create(macronutrient_id: 3, food_id: 8, grams: 12)

FoodComposition.create(macronutrient_id: 1, food_id: 9, grams: 12)
FoodComposition.create(macronutrient_id: 2, food_id: 9, grams: 20)
FoodComposition.create(macronutrient_id: 3, food_id: 9, grams: 10)

FoodComposition.create(macronutrient_id: 1, food_id: 10, grams: 12)
FoodComposition.create(macronutrient_id: 3, food_id: 10, grams: 10)

FoodComposition.create(macronutrient_id: 1, food_id: 11, grams: 30)
FoodComposition.create(macronutrient_id: 2, food_id: 11, grams: 8)
FoodComposition.create(macronutrient_id: 3, food_id: 11, grams: 3)

FoodComposition.create(macronutrient_id: 1, food_id: 12, grams: 11)
FoodComposition.create(macronutrient_id: 2, food_id: 12, grams: 22)
FoodComposition.create(macronutrient_id: 3, food_id: 12, grams: 3)

#10 meals composed
MealComposition.create(meal_id: 1, food_id: 1, servings: 2)
MealComposition.create(meal_id: 1, food_id: 12, servings: 2)
MealComposition.create(meal_id: 1, food_id: 3, servings: 1)
MealComposition.create(meal_id: 1, food_id: 4, servings: 3)

MealComposition.create(meal_id: 2, food_id: 1, servings: 2)
MealComposition.create(meal_id: 2, food_id: 10, servings: 2)
MealComposition.create(meal_id: 2, food_id: 4, servings: 1)
MealComposition.create(meal_id: 2, food_id: 4, servings: 3)

MealComposition.create(meal_id: 3, food_id: 10, servings: 2)
MealComposition.create(meal_id: 3, food_id: 12, servings: 2)
MealComposition.create(meal_id: 3, food_id: 2, servings: 3)
MealComposition.create(meal_id: 3, food_id: 4, servings: 3)

MealComposition.create(meal_id: 4, food_id: 1, servings: 1)
MealComposition.create(meal_id: 4, food_id: 2, servings: 2)
MealComposition.create(meal_id: 4, food_id: 3, servings: 4)
MealComposition.create(meal_id: 4, food_id: 4, servings: 3)

MealComposition.create(meal_id: 5, food_id: 1, servings: 2)
MealComposition.create(meal_id: 5, food_id: 8, servings: 2)
MealComposition.create(meal_id: 5, food_id: 7, servings: 1)
MealComposition.create(meal_id: 5, food_id: 4, servings: 3)

MealComposition.create(meal_id: 6, food_id: 1, servings: 2)
MealComposition.create(meal_id: 6, food_id: 6, servings: 2)
MealComposition.create(meal_id: 6, food_id: 5, servings: 1)
MealComposition.create(meal_id: 6, food_id: 2, servings: 3)

MealComposition.create(meal_id: 7, food_id: 9, servings: 2)
MealComposition.create(meal_id: 7, food_id: 10, servings: 2)
MealComposition.create(meal_id: 7, food_id: 3, servings: 1)
MealComposition.create(meal_id: 7, food_id: 4, servings: 3)

MealComposition.create(meal_id: 8, food_id: 1, servings: 4)
MealComposition.create(meal_id: 8, food_id: 5, servings: 1)
MealComposition.create(meal_id: 8, food_id: 3, servings: 1)
MealComposition.create(meal_id: 8, food_id: 10, servings: 8)

MealComposition.create(meal_id: 9, food_id: 1, servings: 2)
MealComposition.create(meal_id: 9, food_id: 12, servings: 2)

MealComposition.create(meal_id: 10, food_id: 10, servings: 2)
MealComposition.create(meal_id: 10, food_id: 12, servings: 2)
MealComposition.create(meal_id: 10, food_id: 3, servings: 1)
MealComposition.create(meal_id: 10, food_id: 4, servings: 3)
MealComposition.create(meal_id: 10, food_id: 1, servings: 2)
MealComposition.create(meal_id: 10, food_id: 9, servings: 2)
MealComposition.create(meal_id: 10, food_id: 8, servings: 1)
MealComposition.create(meal_id: 10, food_id: 5, servings: 3)
