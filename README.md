# Macro Tracker

This is a Rails application that allows users to create meals, and to keep track of the macronutrient compositions of those meals. For this app, a macronutrient composition is represented as the total grams of the macronutrient and the percentage of calories the macronutrient contributes to the meal. It was designed with the intention to help users create meals that could align with certain dietary goals concerning amounts of carbohydrates, proteins, and fats.


## Installation

1. Fork and clone the repository

2. Change into app directory

3. Run bundle and migrate files

2. Change into app directory

3. Run bundle and migrate files

        $ bundle
        $ rake db:migrate

4. To run server use the thin gem

        $ thin start --ssl


## Usage

1. Login/Signup
2. User Functionality
3. See Meals

        - See individaul meal
        - See foods within an individual meal
        - Create/Add foods for an individual meal
        - Remove foods for an individual meal

3. Create Meal
4. Update Meal
5. Destroy Meal
6. See Food
6. Update Food
7. Destroy Food
8. Logout


## Contributing

Bug reports and pull requests are welcome on GitHub.


## License

This application is available as open source under the terms of the
        <a href="LICENSE.md">LICENSE</a>
