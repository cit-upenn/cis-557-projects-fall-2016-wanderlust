Given (/^I have the database setup with info$/) do
	User.create(
		email: "arghya@seas.upenn.edu",
		password: "12345678",
		password_confirmation: "12345678")
	User.create(
		email: "animeshm@seas.upenn.edu",
		password: "qwertyuiop",
		password_confirmation: "qwertyuiop")
end

Given (/^I have landed on the search page after logging in$/) do
	visit(new_user_session_path)
  fill_in 'Email', :with => "animeshm@seas.upenn.edu"
  fill_in 'Password', :with => "qwertyuiop"
  click_button "Log in"
	visit(plans_path)
end

When (/^I fill in the form with valid details of a remote place$/) do
	fill_in "plan[city]", :with => "OYMYAKON"
	fill_in "plan[state]", :with => "RUSSIA"
	fill_in "plan[miles]", :with => "30"
	click_button "Submit"
end

When (/^I fill in the form with valid details$/) do
	fill_in "plan[city]", :with => "Philadelphia"
	fill_in "plan[state]", :with => "PA"
	fill_in "plan[miles]", :with => "5"
	click_button "Submit"
end

Then (/^I should see the places nearby$/) do
	# save_and_open_page
	#  number_places = page.find_all(:xpath, "count(//*[contains(.,\"Contact\")])") 
	#  assert number_places > 1
	# assert page.has_xpath?("//*[contains(.,\"Contact\")]" , :count => 2)
	assert page.find(:xpath, "//body").text.split('Contact').length > 2

	# nation_column = page.xpath("count(//*[contains(.,'Contact')])")
	
end

Then (/^I should see only one place nearby$/) do
	# save_and_open_page
	assert page.find(:xpath, "//body").text.split('Contact').length == 2
	# assert page.has_xpath?("//*[contains(.,\"Places nearby\")]")
end

When (/^I enter a location with no suggested places$/) do
	fill_in "plan[city]", :with => "abcd"
	fill_in "plan[state]", :with => "aaa"
	fill_in "plan[miles]", :with => "5"
	click_button "Submit"
end

Then (/^I should see a message which says that no places were retrieved$/) do
	assert page.has_content?("No places could be returned. Location entered does not seem valid.")
end
