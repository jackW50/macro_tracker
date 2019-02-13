# Specifications for the Rails Assessment

Specs:

- [x] Using Ruby on Rails for the project
#Used rails 5.2.2
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
#User has many meals.
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
#A meal belongs to a user.
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
# A meal has many foods through meal_compositions and food has many meals through meal_compositions.
# A food has many macronutrients through food_compositions, and a macronutrient has many foods through food_compositions.

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
# Table meal_compositions has a food_servings column. Table food_compositions has a macronutrient_grams column.

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
# Have validations for presence, uniqueness, and numericality.

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
# scope for todays meals.

- [x] Include signup (how e.g. Devise)
#users#new

- [x] Include login (how e.g. Devise)
#sessions#new

- [x] Include logout (how e.g. Devise)
#sessions#destroy

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
#Ominauth(Facebook)

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
#meals/:meal_id/foods

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
#meals/:meal_id/foods/new


- [x] Include form display of validation errors (form URL e.g. /recipes/new)
#class fields_with_errors with red borders and list of errors on object instance above form.

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
