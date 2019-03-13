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
links = ['Basic Auth', 'Drag and Drop', 'File Download', 'File Upload', 'Hovers', 'Dynamic Loading']

links.each do |link|
  if index.has_link? link
    puts "Test 6.1: has link #{link}. PASSED"
  else
    puts "Test 6.1: hasn't link #{link}. NOT PASSED"
  end
end

index.quit
