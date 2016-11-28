Given (/^I have set up the user database with valid info$/) do
	User.create(
		email: "arghya@seas.upenn.edu",
		password: "12345678",
		password_confirmation: "12345678")
	User.create(
		email: "animeshm@seas.upenn.edu",
		password: "qwertyuiop",
		password_confirmation: "qwertyuiop")
end

Given (/^I am in the search page after logging in$/) do
	visit(new_user_session_path)
  fill_in 'Email', :with => "arghya@seas.upenn.edu"
  fill_in 'Password', :with => "12345678"
  click_button "Log in"
	visit(plans_path)
end

When (/^I fill up the form with valid city, state and miles details$/) do
	fill_in "plan[city]", :with => "Philadelphia"
	fill_in "plan[state]", :with => "PA"
	fill_in "plan[miles]", :with => "5"
	click_button "Submit"
end

Then (/^I should be able to view some restaurants nearby$/) do
	# assert page.has_content?("Review")
	assert page.has_xpath?("//*[contains(.,\"Review\")]")
end

When (/^I enter valid combination of city and state name within USA but miles more than 25$/) do
	fill_in "plan[city]", :with => "Philadelphia"
	fill_in "plan[state]", :with => "PA"
	fill_in "plan[miles]", :with => "35"
	click_button "Submit"
end

Then (/^I should get a message saying unable to suggest restaurants$/) do
	assert page.has_content?("Unable to suggest restaurants")
end

When (/^I enter combination of city and state name that does not exist or is outside USA$/) do
	fill_in "plan[city]", :with => "Delhi"
	fill_in "plan[state]", :with => "India"
	fill_in "plan[miles]", :with => "5"
	click_button "Submit"
end

Then (/^I should not be getting any suggested restaurants$/) do
	# assert page.has_content?("Review")
	assert !page.has_xpath?("//*[contains(.,\"Review\")]")
end
