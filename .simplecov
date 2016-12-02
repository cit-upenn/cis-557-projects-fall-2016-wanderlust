# features/support/env.rb
require 'simplecov'
SimpleCov.profiles.define 'myprofile' do
  add_filter '/test/'
  add_filter '/config/'

  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Libraries', 'lib'
end

# .simplecov
SimpleCov.start 'myprofile'
