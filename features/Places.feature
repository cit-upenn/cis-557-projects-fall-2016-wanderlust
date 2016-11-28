Feature: Display suggested places for a location
As a registered user
I must see the suggested places for a location

Scenario: User should see a list of places
Given I have the database setup with info
And I have landed on the search page after logging in
When I fill in the form with valid details
Then I should see the places nearby

Scenario: Enter location with no suggestions
Given I have the database setup with info
And I have landed on the search page after logging in
When I enter a location with no suggested places
Then I should see a message which says that no places were retrieved

