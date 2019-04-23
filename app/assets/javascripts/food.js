class Food {
  constructor(id, name) {
    this.id = id,
    this.name = name
  }
  //This method take a MealComposition object as an argument.
  addFoodToList(meal_composition) {
    return '<li>' +
    '<a href="/foods/' +
    this.id +
    '?meal_id=' +
    meal_composition.mealId +
    '">' +
    this.name +
    '</a>' +
    '<ul><li>Servings: ' +
    meal_composition.foodServings +
    '</li><li>' +
    '<button name="button" id="remove-food" type="button" data="' +
    meal_composition.id +
    '">Remove</button>' +
    '</ul></li>';
  }
  foodLink() {
    return '<li><a href="#" data="' +
    this.id +
    '">' +
    this.name +
    '</a></li>'
  }
}
