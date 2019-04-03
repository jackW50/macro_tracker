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

console.log('hello');

class Meal {
  constructor(id, time, mealCompositions) {
    this.id = id;
    this.time = time;
    //mealCompositions is equal to an array;
    this.mealCompositions = mealCompositions;
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
      '</li></ul></li>';
    });
  }
}

class Food {
  constructor(id, name) {
    this.id = id,
    this.name = name
  }
}
