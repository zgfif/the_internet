require 'page-object'

require 'watir'

class Hover
  include PageObject

  page_url('http://the-internet.herokuapp.com/hovers')

  # DIVs
  div(:first_img, class: 'figure', index: 0)

  div(:second_img, class: 'figure', index: 1)

  div(:third_img, class: 'figure', index: 2)

  # LINKs
  link(:first_link, href: '/users/1')

  link(:second_link, href: '/users/2')

  link(:third_link, href: '/users/3')

  def hover_above object
    object.hover
  end

  def has_element? object
    object.present?
  end
end

browser = Watir::Browser.new :firefox

obj = Hover.new browser, true

#TESTS
obj.hover_above obj.first_img_element

# validate presence of first link
if obj.has_element? obj.first_link_element
  puts "Test 5.1: user1 is PASSED"
else
  puts 'Test 5.1: user1 is NOT PASSED'
end

obj.hover_above obj.second_img_element

# validate presence of second link
if obj.has_element? obj.second_link_element
  puts 'Test 5.1: user2 is PASSED'
else
  puts 'Test 5.1: user2 is NOT PASSED'
end

obj.hover_above obj.third_img_element

# validate presence of third link
if obj.has_element? obj.third_link_element
  puts 'Test 5.1: user3 is PASSED'
else
  puts 'Test 5.1: user3 is NOT PASSED'
end

obj.quit
