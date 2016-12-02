Given (/^I have set up the user database$/) do
	User.create(
		email: "arghya@seas.upenn.edu",
		password: "12345678",
		password_confirmation: "12345678")
	User.create(
		email: "animeshm@seas.upenn.edu",
		password: "qwertyuiop",
		password_confirmation: "qwertyuiop")
end

Given (/^I am in the user sign in page$/) do
	visit(new_user_session_path)
end

When (/^I fill the username and password and sign in$/) do
	fill_in 'Email', :with => "arghya@seas.upenn.edu"
	fill_in 'Password', :with => "12345678"
	click_button "Log in"
end

Then (/^I should be able to sign in successfully and route to application's homepage$/) do
	assert page.has_content?("Signed in successfully.")
	# assert page.has_content?("Tom 's page")
end

Given (/^I sign in with username and password$/) do
	fill_in 'Email', :with => "animeshm@seas.upenn.edu"
	fill_in 'Password', :with => "qwertyuiop"
	click_button "Log in"
end

Given (/^I'm in the user homepage$/) do
	assert page.has_content?("Signed in successfully.")
end

When (/^I click the sign out$/) do
	click_link "Logout"
end

Then (/^I should be able to sign out and see login and sign up link in the page$/) do
	assert page.has_content?("Signed out successfully.")
end

When (/^I enter incorrect email or password$/) do
	fill_in 'Email', :with => "animeshm@seas.upenn.edu"
	fill_in 'Password', :with => "12345678"
	click_button "Log in"
end

Then (/^I can not sign in$/) do
	assert page.has_content?("Invalid email or password.")
end