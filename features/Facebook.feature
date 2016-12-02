Feature: Display suggested places for a location
As a registered user
I must see the suggested places for a location

Scenario: Logging in through Facebook
Given I am on the welcome page
When I login through Facebook
Then I should see the place nearby
