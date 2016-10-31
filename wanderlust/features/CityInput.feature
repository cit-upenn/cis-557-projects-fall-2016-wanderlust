Feature: User enters the city name to travel in
		As a registered user
		I have the option to enter the city name I want to travel in

	Scenario: Try to look for the city's weather entering the city's name
		Given I am on the search page
		When I enter the city name with valid state and miles details
		Then I should be able to view the weather of that city

	Scenario: Enter city's name with length less than 3
		Given I am on the search page
			And I enter state and number of miles correctly
		When I enter a city's name of less than 3 characters
		Then I should not be able to get the results

	Scenario: Press submit without entering city name
		Given I am on the search page
			And I enter state and number of miles correctly
		When I leave the city name blank
		Then I get an error

	Scenario: Enter city name that is not in given state
		Given I am on the search page
		When I enter a city that is not in a given state
		Then I should get a message of invalid input

	Scenario: Enter city or state name that is invalid
		Given I am on the search page
		When I enter a city or state name that does not exist
		Then I should get a message of invalid input