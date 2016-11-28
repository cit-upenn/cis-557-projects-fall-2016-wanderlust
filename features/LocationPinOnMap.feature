Feature: Display suggested locations on map
		As a registered user
		I must see the suggested locations on the map

    Scenario: User should be able to see current location details below the map
		Given I am on the search page to see restaurants and places on a map
		When I enter the place around which I want to travel
		Then I should be able to see current location details below the map

	Scenario: User should be able to see the links to restaurants and places
		Given I am on the search page to see restaurants and places on a map
		When I enter the place around which I want to travel
		Then I should be able to see the links to restaurants and places
