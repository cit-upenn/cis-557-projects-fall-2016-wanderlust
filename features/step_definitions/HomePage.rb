Given (/^I have data in the database$/) do
	User.create(
		email: "archith06@gmail.com",
		password: "asdfasdf",
		password_confirmation: "asdfasdf")
	User.create(
		email: "animeshm@seas.upenn.edu",
		password: "qwertyuiop",
		password_confirmation: "qwertyuiop")
end

Given (/^I am on the sign in page for user$/) do
	visit(new_user_session_path)
end

When (/^I enter username and password to sign in$/) do
	fill_in 'Email', :with => "archith06@gmail.com"
	fill_in 'Password', :with => "asdfasdf"
	click_button "Log in"
end

Then (/^I should be able to successfully sign in then go to location page$/) do
	assert page.has_content?("Signed in successfully.")
	# assert page.has_content?("Tom 's page")
end

Given (/^I successfully signed in$/) do
	fill_in 'Email', :with => "animeshm@seas.upenn.edu"
	fill_in 'Password', :with => "qwertyuiop"
	click_button "Log in"
end

Given (/^I'm in the user location page$/) do
	assert page.has_content?("Signed in successfully.")
end

When (/^I click on the logout button$/) do
	click_link "Logout"
end

Then (/^I should be able to return to home page$/) do
	assert page.has_content?("Signed out successfully.")
end

When (/^I key in email or password incorrectly$/) do
	fill_in 'Email', :with => "archith06@gmail.com"
	fill_in 'Password', :with => "12345678"
	click_button "Log in"
end

Then (/^I should not be able to sign in$/) do
	assert page.has_content?("Invalid email or password.")
end
