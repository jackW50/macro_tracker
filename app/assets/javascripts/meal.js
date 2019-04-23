class Meal {
  constructor(id, time, mealCompositions) {
    this.id = id;
    this.time = time;
    this.calories = ''
    this.user = ''
    //mealCompositions is equal to an array;
    this.mealCompositions = mealCompositions;
  }
  foods() {
    return this.mealCompositions.map( e => {
      return new Food(e.food_id, e.food_name)
    })
  }
  foodList() {
    return this.mealCompositions.map(element => {
      return '<li>' +
      '<a href="/foods/' +
      element.food_id +
      '?meal_id=' + element.meal_id + '">' +
      element.food_name +
      '</a>' +
      '<ul><li>Servings: ' +
      element.food_servings +
      '</li><li>' +
      '<button name="button" id="remove-food" type="button" data="' +
      element.id +
      '">Remove</button>' +
      '</ul></li>';
    });
  }
  mealListItem() {
    return '<ul><li>' +
    this.time +
    '</li><li><a href="#" id="see-foods-' + this.id + '" data="' +
    this.id +
    '">see foods</a></li><ul id="' +
     this.id +
    '"></ul></ul>'
  }
  liLink() {
    return '<ul><li><a href="/meals/' +
    this.id +
    '">' +
    this.time +
    '</a></li></ul><p class="calories-list">- ' +
    this.calories +
    ' calories</p>'
  }
}
