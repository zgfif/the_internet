require 'page-object'

require 'watir'

class Index
  include PageObject

  page_url('http://the-internet.herokuapp.com/')

  def correct_title? title
    self.title == title
  end

  def has_link? ref
    self.link(text: ref).present?
  end
end

browser = Watir::Browser.new :firefox

index = Index.new browser, true

#  TESTS

# test is this the index page
puts index.correct_title? 'The Internet'

# testing existing links
puts index.has_link? 'Basic Auth'

puts index.has_link? 'Drag and Drop'

puts index.has_link? 'File Download'

puts index.has_link? 'File Upload'

puts index.has_link? 'Hovers'

puts index.has_link? 'Dynamic Loading'

index.quit
