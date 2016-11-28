Feature: Display suggested locations on map
		As a registered user
		I must see the suggested locations on the map

	Scenario: User should be able to see the map
		Given I am on the search page to see the locations
		When I enter the location from where I want to travel
		Then I should be able to see the map

	Scenario: There must be atleast one pin on the map
		Given I am on the search page to see the locations
		When I enter the location from where I want to travel
		Then I should see atleast one pin on the map

	Scenario: User should be able to see locations links below the map
		Given I am on the search page to see the locations
		When I enter the location from where I want to travel
		Then I should be able to see location description below the map
