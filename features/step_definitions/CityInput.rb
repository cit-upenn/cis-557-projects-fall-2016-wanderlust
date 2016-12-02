Given (/^I am on the search page$/) do
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

When (/^I enter the city name with valid state and miles details$/) do
	fill_in "plan[city]", :with => "Philadelphia"
	fill_in "plan[state]", :with => "PA"
	fill_in "plan[miles]", :with => "5"
	click_button "Submit"
end

Then (/^I should be able to view the weather of that city$/) do
	assert page.has_content?('Philadelphia')
end

Given (/^I enter state and number of miles correctly$/) do
	fill_in "plan[state]", :with => "PA"
	fill_in "plan[miles]", :with => "5"
end

When (/^I enter a city's name of less than 3 characters$/) do
	fill_in "plan[city]", :with => "Ph"
	click_button "Submit"
end

Then (/^I should not be able to get the results$/) do
	assert page.has_content?('City is too short (minimum is 3 characters)')
end

When (/^I leave the city name blank$/) do
	fill_in "plan[city]", :with => ""
	click_button "Submit"
end

Then (/^I get an error$/) do
	assert page.has_content?("City can't be blank")
end

When (/^I enter a city that is not in a given state$/) do
	fill_in "plan[city]", :with => "Los Angeles"
	fill_in "plan[state]", :with => "NY"
	fill_in "plan[miles]", :with => "5"
	click_button "Submit"
end

Then (/^I should get a message of invalid input$/) do
	assert page.has_content?("Invalid Input")
end

When (/^I enter a city or state name that does not exist$/) do
	fill_in "plan[city]", :with => "lalaland"
	fill_in "plan[state]", :with => "NY"
	fill_in "plan[miles]", :with => "5"
	click_button "Submit"
end