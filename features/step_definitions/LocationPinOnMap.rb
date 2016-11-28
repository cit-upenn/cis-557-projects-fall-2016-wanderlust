Given(/^I am on the search page to see restaurants and places on a map$/) do
	User.create(
    email: "archith06@gmail.com",
    password: "asdfasdf",
    password_confirmation: "asdfasdf")
  visit(new_user_session_path)
  fill_in 'Email', :with => "archith06@gmail.com"
  fill_in 'Password', :with => "asdfasdf"
  click_button "Log in"
  visit(plans_path)
end

When (/^I enter the place around which I want to travel$/) do
	fill_in "plan[city]", :with => "Philadelphia"
	fill_in "plan[state]", :with => "PA"
	fill_in "plan[miles]", :with => "5"
	click_button "Submit"
end

Then (/^I should be able to see current location details below the map$/) do
	assert page.has_xpath?("//*[contains(.,\"Philadelphia, PA\")]")
end

Then (/^I should be able to see the links to restaurants and places$/) do
  assert page.has_xpath?("//*[contains(.,\"South Philly Barbacoa\")]")
end
