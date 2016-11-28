Feature: User in the search page
		 As a registered user
		 I want to see nearby popular places based on my location

Scenario: Enter location within USA and miles less than 25
Given I have set up the user database with valid info
And I am in the search page after logging in
When I fill up the form with valid city, state and miles details
Then I should be able to view some restaurants nearby

Scenario: Enter location within USA but miles more than 25
Given I have set up the user database with valid info
And I am in the search page after logging in
When I enter valid combination of city and state name within USA but miles more than 25
Then I should get a message saying unable to suggest restaurants

Scenario: Enter location outside USA and miles within than 25
Given I have set up the user database with valid info
And I am in the search page after logging in
When I enter combination of city and state name that does not exist or is outside USA
Then I should not be getting any suggested restaurants 
