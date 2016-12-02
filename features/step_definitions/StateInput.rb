Given (/^I am on the search page to search with state name$/) do
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

When (/^I enter the state name with valid city and miles details$/) do
	fill_in "plan[city]", :with => "Philadelphia"
	fill_in "plan[state]", :with => "PA"
	fill_in "plan[miles]", :with => "5"
	click_button "Submit"
end

Then (/^I should be able to view the weather of the city in that state$/) do
	assert page.has_content?('Philadelphia')
end

Given (/^I enter city and number of miles correctly$/) do
	fill_in "plan[city]", :with => "Philadelphia"
	fill_in "plan[miles]", :with => "5"
end

When (/^I enter a state's name of less than 2 characters$/) do
	fill_in "plan[state]", :with => "P"
	click_button "Submit"
end

Then (/^I should get an error related to state's name$/) do
	assert page.has_content?('State is too short (minimum is 2 characters)')
end

When (/^I leave the state name blank$/) do
	fill_in "plan[state]", :with => ""
	click_button "Submit"
end

Then (/^I get an error for not entering state name$/) do
	assert page.has_content?("State can't be blank")
end