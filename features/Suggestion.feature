Feature: User enters a location to get recommended clothes
As a registered user
I want to see some suggested clothes based on my location

Scenario: Try to look for recommended clothes by entering the city's name
Given I have set up the weather database
And I am on the search or main page
When I fill up the form with valid state and miles details
Then I should be able to view the suggested clothes

Scenario: Enter city or state name that is invalid
Given I have set up the weather database
And I am on the search or main page
When I enter combination of city and state name that does not exist
Then I should get a message saying weather can not be determined
