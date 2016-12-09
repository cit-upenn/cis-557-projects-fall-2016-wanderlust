Feature: User in the login page
		 As a registered user
		 I want to sign in with my username and password


	Scenario: Sign in with username and password
		Given I have set up the user database
			And I am in the user sign in page
		When I fill the username and password and sign in
		Then I should be able to sign in successfully and route to application's homepage

	Scenario: User sign out
		Given I have set up the user database
			And I am in the user sign in page
			And I sign in with username and password
			And I'm in the user homepage
		When I click the sign out
		Then I should be able to sign out and see login and sign up link in the page

	Scenario: Invalid username or password
		Given I have set up the user database
			And I am in the user sign in page
		When I enter incorrect email or password
		Then I can not sign in

		Scenario: Logging in through Facebook
		Given I am on the welcome page
		When I login through Facebook
		Then I should get successful authentication message
