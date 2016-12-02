Given(/^I am on the search page to see the locations$/) do
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

When (/^I enter the location from where I want to travel$/) do
	fill_in "plan[city]", :with => "Philadelphia"
	fill_in "plan[state]", :with => "PA"
	fill_in "plan[miles]", :with => "5"
	click_button "Submit"
end


Then (/^I should be able to see the map$/) do
	assert page.has_xpath?('//*[@id="sidebar_builder"]')
end

Then(/^I should see atleast one pin on the map$/) do
  assert page.has_selector?('#markers img', count:0)
end

Then (/^I should be able to see location description below the map$/) do
	assert page.has_xpath?("//*[contains(.,\"Philadelphia, PA\")]")
end
