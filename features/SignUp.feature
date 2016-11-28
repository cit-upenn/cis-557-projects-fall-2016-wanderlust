Feature: User sign up page

Scenario: Add an username
Given I'm on the user sign up page
When I add a new user
Then I should be able to see the userpage with user signing in

Scenario: Add an user without email
Given I'm on the user sign up page
When I add a new user without email
Then I can't create an user without email

Scenario: Add an user without password
Given I'm on the user sign up page
When I add a new user without password
Then I can't create an user without password

Scenario: Add an user when password and confirm password do not match
Given I'm on the user sign up page
When I add a new user where password fields do not match
Then I can't create an user without fields matching