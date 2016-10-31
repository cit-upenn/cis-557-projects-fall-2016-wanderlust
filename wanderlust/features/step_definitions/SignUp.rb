Given (/^I'm on the user sign up page$/) do
	visit(new_user_registration_path)
end

When (/^I add a new user$/) do
	fill_in 'Email', :with => "arghya@seas.upenn.edu"
	fill_in 'Password', :with => "12345678"
	fill_in 'Password confirmation', :with => "12345678"
	click_button "Sign up"
end

Then (/^I should be able to see the userpage with user signing in$/) do
	assert page.has_content?("Welcome! You have signed up successfully.")
end

When (/^I add a new user without email$/) do
	fill_in 'Password', :with => "12345678"
	fill_in 'Password confirmation', :with => "12345678"
	click_button "Sign up"
end

Then (/^I can't create an user without email$/) do
	assert page.has_content?("Email can't be blank")
end

When (/^I add a new user without password$/) do
	fill_in 'Email', :with => "tom@seas.upenn.edu"
	click_button "Sign up"
end

Then (/^I can't create an user without password$/) do
	assert page.has_content?("Password can't be blank")
end

When (/^I add a new user where password fields do not match$/) do
	fill_in 'Email', :with => "animeshm@seas.upenn.edu"
	fill_in 'Password', :with => "qwertyuiop"
	fill_in 'Password confirmation', :with => "1234567890"
	click_button "Sign up"
end

Then (/^I can't create an user without fields matching$/) do
	assert page.has_content?("Password confirmation doesn't match Password")
end