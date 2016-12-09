Given (/^I have the database setup with valid info$/) do
	User.create(
		email: "arghya@seas.upenn.edu",
		password: "12345678",
		password_confirmation: "12345678")
	User.create(
		email: "animeshm@seas.upenn.edu",
		password: "qwertyuiop",
		password_confirmation: "qwertyuiop")
end

Given (/^I have landed on the search page after logging-in$/) do
	visit(new_user_session_path)
  fill_in 'Email', :with => "animeshm@seas.upenn.edu"
  fill_in 'Password', :with => "qwertyuiop"
  click_button "Log in"
	visit(plans_path)
end

When (/^I fill in the form with reliable details$/) do
	fill_in "plan[city]", :with => "OYMYAKON"
	fill_in "plan[state]", :with => "RUSSIA"
	fill_in "plan[miles]", :with => "30"
	click_button "Submit"
end


Then (/^I should see tabs for different category in results page$/) do
	assert page.has_xpath?("//*[@class='tab-content']")
end

Given (/^I am on the welcome page of the application$/) do
	visit(welcome_index_path)
end

Given (/^I am on the signup page$/) do
	visit(new_user_registration_path)
end



Then (/^I should see the all the buttons properly formatted$/) do
	assert page.has_xpath?("//*[@class='navbar navbar-default']")
end

Then (/^I should see the form in proper format$/) do
  # save_and_open_page
	assert page.has_xpath?("//*[contains(@class,'field form-group')]")
end
