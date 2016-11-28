Given (/^I am on the search page to enter the travel radius$/) do
	User.create(
    email: "arghya@seas.upenn.edu",
    password: "12345678",
    password_confirmation: "12345678")
  visit(new_user_session_path)
  fill_in 'Email', :with => "arghya@seas.upenn.edu"
  fill_in 'Password', :with => "12345678"
  click_button "Log in"
	visit(plans_path)
end

When (/^I enter the number of miles with valid city and state name$/) do
	fill_in "plan[city]", :with => "Philadelphia"
	fill_in "plan[state]", :with => "PA"
	fill_in "plan[miles]", :with => "25"
	click_button "Submit"
end

Then (/^I should be able to view the weather correctly$/) do
	assert page.has_content?('Philadelphia')
end

Given (/^I enter city and state name correctly$/) do
	fill_in "plan[city]", :with => "Philadelphia"
	fill_in "plan[state]", :with => "PA"
end

When (/^I enter the travel radius greater than 50$/) do
	fill_in "plan[miles]", :with => "51"
	click_button "Submit"
end

Then (/^I should get an error related to number of miles$/) do
	assert page.has_content?('Miles must be less than or equal to 25')
end

When (/^I leave the number of miles blank$/) do
	fill_in "plan[miles]", :with => ""
	click_button "Submit"
end

Then (/^I get an error for not entering number of miles$/) do
	assert page.has_content?("Miles can't be blank")
end

When (/^I enter the travel radius that is not numeric$/) do
	fill_in "plan[miles]", :with => "abcd"
	click_button "Submit"
end

Then (/^I should be asked to enter a number for number of miles$/) do
	assert page.has_content?("Miles is not a number")
end