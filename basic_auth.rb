require 'page-object'

require 'watir'

class BasicAuth
  include PageObject

  def correct_title? title
    self.title == title
  end

  def has_link? ref
    self.link(text: ref).present?
  end

  def authenticate? login, pass
    self.goto("http://#{login}:#{pass}@the-internet.herokuapp.com/basic_auth")

    self.current_url == 'http://admin:admin@the-internet.herokuapp.com/basic_auth'
  end
end

browser = Watir::Browser.new :chrome

auth = BasicAuth.new browser

auth.goto 'http://the-internet.herokuapp.com/'

# TESTS

puts auth.correct_title? 'The Internet' #test is this index page

# testing existing links
puts auth.has_link? 'Basic Auth'

puts auth.has_link? 'Drag and Drop'

#testing authentication with
begin
  puts auth.authenticate? 'admin', 'admin' #login 'admin' and password 'admin' for 'Basic Auth' link
rescue Timeout::Error
  puts 'invalid login/password'
end
