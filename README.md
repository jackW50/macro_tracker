# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Macro Tracker

This is a Rails application that allows users to create meals, and to keep track of the macronutrient compositions of those meals. For this app, a macronutrient composition is represented as the total grams of the macronutrient and the percentage of calories the macronutrient contributes to the meal. It was desinged with the intention to help users create meals that could align with certian dietary goals concerning amounts of carbohydrates, proteins, and fats.


## Installation

1. Fork and clone the repository

2. Change into app directory 
3. Run bundle and migrate files
        $ bundle
        $ rake db:migrate
        
4. To run server use the thin gem
        $ thin start --ssl

## Usage

1. Login/Signup
2. User Functionality
        1. See Meals
                a. See the foods in the meal.
                b. Create/Add foods to meal.
                c. Remove foods from the meal.
        2. Create Meals
        3. Update Meals
        4. Destroy Meals
        5. Update Foods
        6. Destroy Foods
3. Logout


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kev112/PlotMaker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in this project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/freeWillee/project-manager_001/blob/master/CODE_OF_CONDUCT.md).

## License

This application is available as open source under the terms of the
        <a href="LICENSE.md">LICENSE</a>
        
 
 
