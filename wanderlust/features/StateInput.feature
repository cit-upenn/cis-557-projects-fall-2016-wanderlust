Feature: User enters a state name to travel in
		As a registered user
		I have the option to enter the state name I want to travel in

	Scenario: Try to look for the city's weather entering the state's name
		Given I am on the search page to search with state name
		When I enter the state name with valid city and miles details
		Then I should be able to view the weather of the city in that state

	Scenario: Enter city's name with length less than 2
		Given I am on the search page to search with state name
			And I enter city and number of miles correctly
		When I enter a state's name of less than 2 characters
		Then I should get an error related to state's name

	Scenario: Press submit without entering state name
		Given I am on the search page to search with state name
			And I enter city and number of miles correctly
		When I leave the state name blank
		Then I get an error for not entering state name