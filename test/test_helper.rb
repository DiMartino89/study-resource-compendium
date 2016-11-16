ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Capybara
# see https://github.com/jnicklas/capybara#using-capybara-with-testunit
class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  def login_as(user)
	post login_path, params: {session: { email:  user.email, password: 'secret'}}
  end
  
  def login_for_capybara(user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password_digest
    click_button "Login"
  end


  # Reset sessions and driver between tests
  # Use super wherever this method is redefined in your individual test classes
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

def is_logged_in?
  !session[:user_id].nil?
end