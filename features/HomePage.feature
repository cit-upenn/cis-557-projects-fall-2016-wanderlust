Feature: User in the sign in page
		 As a registered user
		 I want to sign in with my username and password


	Scenario: Log in with existing username and password
		Given I have data in the database
			And I am on the sign in page for user
		When I enter username and password to sign in 
		Then I should be able to successfully sign in then go to location page

	Scenario: User Log out
		Given I have data in the database
			And I am on the sign in page for user
			And I successfully signed in
			And I'm in the user location page
		When I click on the logout button
		Then I should be able to return to home page

	Scenario: Incorrect username or password
		Given I have data in the database
			And I am on the sign in page for user
		When I key in email or password incorrectly
		Then I should not be able to sign in
