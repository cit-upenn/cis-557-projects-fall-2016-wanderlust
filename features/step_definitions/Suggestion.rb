Given (/^I have set up the weather database$/) do
  Weather.create(
  icon: "chanceflurries",
  advice: "Don't forget to wear coat!!!")
  Weather.create(
  icon: "chancerain",
  advice: "Don't forget to carry your umbrella and wear rain boots!!!")
  Weather.create(
  icon: "chancesleet",
  advice: "Its gonna snow!! wear a puffer!!!")
  Weather.create(
  icon: "chancesnow",
  advice: "Its gonna snow!! wear a puffer!!!")
  Weather.create(
  icon: "chancetstorms",
  advice: "Cover yourself, storm is coming!!! wear layers")
  Weather.create(
  icon: "clear",
  advice: "Weather is clear today!!! wear whatever you want")
  Weather.create(
  icon: "cloudy",
  advice: "Its gonna be windy!!!, don't forget to wear wind sheeter")
  Weather.create(
  icon: "flurries",
  advice: "wear winter boots, flurries are coming!!! ")
  Weather.create(
  icon: "fog",
  advice: "Its gonna be chilly outside, cover yourself!!! wear a coat")
  Weather.create(
  icon: "hazy",
  advice: "wear a mask, drive carefully!!!")
  Weather.create(
  icon: "mostlycloudy",
  advice: "Its gonna be cloudy!!!, don't forget to wear your wind sheeter")
  Weather.create(
  icon: "mostlysunny",
  advice: "wear shorts, its gonna be hot !!! ")
  Weather.create(
  icon: "partlycloudy",
  advice: "Its gonna be warm outside!!!, wear shorts if you like")
  Weather.create(
  icon: "partlysunny",
  advice: "wear shorts, its gonna be hot !!! ")
  Weather.create(
  icon: "sleet",
  advice: "Its gonna be freexing cold!!!, wear layers")
  Weather.create(
  icon: "rain",
  advice: "Leave early, its gonna rain cats and dogs!!!. Don't forget to wear rain coat.")
  Weather.create(
  icon: "snow",
  advice: "Please a good winter coat to wear, its freezing!!!")
  Weather.create(
  icon: "sunny",
  advice: "Its gonna be freeking cold!!!, wear layers")
  Weather.create(
  icon: "tstorms",
  advice: "Carefull !! wear rain coat !!!")
  Weather.create(
  icon: "unknown",
  advice: "Weather is a breeze today!!!. wear anyting you like")

end

Given (/^I am on the search or main page$/) do
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

When (/^I fill up the form with valid state and miles details$/) do
	fill_in "plan[city]", :with => "Delhi"
	fill_in "plan[state]", :with => "India"
	fill_in "plan[miles]", :with => "5"
	click_button "Submit"
end

Then (/^I should be able to view the suggested clothes$/) do
	assert page.has_content?("wear")
end

When (/^I enter combination of city and state name that does not exist$/) do
	fill_in "plan[city]", :with => "lalaland"
	fill_in "plan[state]", :with => "NY"
	fill_in "plan[miles]", :with => "5"
	click_button "Submit"
end

Then (/^I should get a message saying weather can not be determined$/) do
	assert page.has_content?("Clothes to wear can not be displayed: Input Error")
end
