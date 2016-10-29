Given (/^I have set up the user database$/) do
	User.create(
		email: "arghya@seas.upenn.edu",
		password: "12345678",
		password_confirmation: "12345678")
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

