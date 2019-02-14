# Macro Tracker

This is a Rails application that allows users to create meals, and to keep track of the macronutrient compositions of those meals. For this app, a macronutrient composition is represented as the total grams of the macronutrient and the percentage of calories the macronutrient contributes to the meal. It was desinged with the intention to help users create meals that could align with certian dietary goals concerning amounts of carbohydrates, proteins, and fats.


## Installation

        
$ bundle
$ rake db:migrate
$ thin start --ssl

1. Fork and clone the repository
2. Change into app directory 
3. Run bundle and migrate files      
4. To run server use the thin gem
       
        
$ bundle
$ rake db:migrate
$ thin start --ssl
        

## Usage

1. Login/Signup
2. User Functionality 
        - Users have the abilty to see their meals, and for each individual meal, they can see the foods within that meal, create/add foods for that meal, and remove foods for that meal.
3. Create Meals
4. Update Meals
5. Destroy Meals
6. Update Foods
7. Destroy Foods
8. Logout 


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kev112/PlotMaker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in this project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/freeWillee/project-manager_001/blob/master/CODE_OF_CONDUCT.md).

## License

This application is available as open source under the terms of the
        <a href="LICENSE.md">LICENSE</a>
        
 
 
