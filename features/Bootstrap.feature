Feature: All the pages are responsive
As a registered user
I must interact with a responsive webpage

Scenario: User should interact with responsive results page
Given I have the database setup with valid info
And I have landed on the search page after logging-in
When I fill in the form with reliable details
Then I should see tabs for different category in results page

Scenario: User should interact with responsive welcome page
Given I am on the welcome page of the application
Then I should see the all the buttons properly formatted

Scenario: User should interact with responsive signup page
Given I am on the signup page
Then I should see the form in proper format
