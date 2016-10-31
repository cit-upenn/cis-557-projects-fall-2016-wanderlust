Feature: User enters the travel radius to travel in
		As a registered user
		If I have entered the city and state name correctly
		I have the option to enter the travel radius I want to travel in

	Scenario: Try to enter the travel radius in a city
		Given I am on the search page to enter the travel radius
		When I enter the number of miles with valid city and state name
		Then I should be able to view the weather correctly

	Scenario: Enter number of miles greater than 50
		Given I am on the search page to enter the travel radius
			And I enter city and state name correctly
		When I enter the travel radius greater than 50
		Then I should get an error related to number of miles

	Scenario: Press submit without entering number of miles
		Given I am on the search page to enter the travel radius
			And I enter city and state name correctly
		When I leave the number of miles blank
		Then I get an error for not entering number of miles

	Scenario: Enter number of miles that is not numeric
		Given I am on the search page to enter the travel radius
			And I enter city and state name correctly
		When I enter the travel radius that is not numeric
		Then I should be asked to enter a number for number of miles