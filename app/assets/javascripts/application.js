// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require handlebars
//= require_tree ./templates
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

console.log('hello app js');

class Meal {
  constructor(id, time, mealCompositions) {
    this.id = id;
    this.time = time;
    this.calories = ''
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
      '">' +
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
    '</li><li><a href="#" data="' +
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

class MealComposition {
  constructor(id, foodId, foodServings, mealId) {
    this.id = id,
    this.foodId = foodId,
    this.foodServings = foodServings,
    this.mealId = mealId
  }
}

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

class MacronutrientTable {
  constructor(carbohydrateGrams, carbohydratePercent, proteinGrams, proteinPercent, fatGrams, fatPercent) {
    this.carbohydrateGrams = carbohydrateGrams,
    this.carbohydratePercent = carbohydratePercent,
    this.proteinGrams = proteinGrams,
    this.proteinPercent = proteinPercent,
    this.fatGrams = fatGrams,
    this.fatPercent = fatPercent
  }
  updateTable() {
    $('tr td')[1].innerHTML = this.carbohydrateGrams
    $('tr td')[2].innerHTML = this.carbohydratePercent
    $('tr td')[4].innerHTML = this.proteinGrams
    $('tr td')[5].innerHTML = this.proteinPercent
    $('tr td')[7].innerHTML = this.fatGrams
    $('tr td')[8].innerHTML = this.fatPercent
  }
}

function resetSubmit() {
  $('#add-food-form input[type="submit"]').prop('disabled', false);
}
