require 'page-object'

require 'watir'

class BasicAuth
  include PageObject

  def authenticate? login, pass
    self.goto("http://#{login}:#{pass}@the-internet.herokuapp.com/basic_auth")

    self.current_url == 'http://admin:admin@the-internet.herokuapp.com/basic_auth'
  end
end

browser = Watir::Browser.new :firefox

auth = BasicAuth.new browser

# TESTS

#testing authentication with 'login' and 'password'
if auth.authenticate? 'admin', 'admin'
  puts 'Test 1.1: valid login and password is PASSED'
else
  puts 'Test 1.1: valid login and password is NOT PASSED'
end

if auth.authenticate? 'admin', '2admin'
  puts 'Test 1.2: invalid login and password is NOT PASSED'
else
  puts 'Test 1.2: invalid login and password is PASSED'
end

auth.quit
