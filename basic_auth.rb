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
puts auth.authenticate? 'admin', 'admin'

puts auth.authenticate? 'admin', '2admin'

auth.quit
