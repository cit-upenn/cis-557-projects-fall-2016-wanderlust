Given (/^I am on the welcome page$/) do
	visit(welcome_index_path)
end

When (/^I login through Facebook$/) do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
  :provider => 'facebook',
  :uid => '123545',
  :info => {
                            :email => "rc.arghya@yahoo.in",
                            :password => "rocker"
                          },
  :facebook => {
                            :email => "rc.arghya@yahoo.in",
                            :password => "rocker"
                          }
})
  click_link_or_button 'Sign in with Facebook'
  save_and_open_page

end

Then (/^I should see the place nearby$/) do
  assert page.has_content?("as")
end
