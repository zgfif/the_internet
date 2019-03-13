require 'page-object'

require 'watir'

class DynamicLoading
  include PageObject

  page_url('http://the-internet.herokuapp.com/dynamic_loading')

  link(:link_hidden, href: '/dynamic_loading/1')

  link(:link_dynamic, href: '/dynamic_loading/2')

  button(:button_start, text: 'Start')

  h4(:hello_world, text: 'Hello World!')

  def validate_presence obj
    obj.present?
  end

  def perform_opening obj
     obj
  end

  def press_start
    self.button_start
  end
end

browser = Watir::Browser.new :firefox

dynamic = DynamicLoading.new browser, true

# TESTS

# first link present?
puts dynamic.validate_presence dynamic.link_hidden_element

#second link present?
puts dynamic.validate_presence dynamic.link_dynamic_element


# opening the first link for hidden element
dynamic.perform_opening dynamic.link_hidden

# validate presence of hidden element
before_start = dynamic.validate_presence dynamic.hello_world_element

dynamic.press_start

sleep 6

after_start = dynamic.validate_presence dynamic.hello_world_element

if !before_start&after_start
  puts 'Test 3.1: Test for hidden element is PASSED'
else
  puts 'Test 3.1: Test for hidden element is NOT PASSED'
end

dynamic.back

# opening the second link for dynamically loading element
dynamic.perform_opening dynamic.link_dynamic

# validate presence of dynamically loaded element
before_start = dynamic.validate_presence dynamic.hello_world_element

dynamic.press_start

sleep 6

after_start = dynamic.validate_presence dynamic.hello_world_element

if !before_start&after_start
  puts 'Test 3.2: Test for dynamic element is PASSED'
else
  puts 'Test 3.2: Test for dynamic element is NOT PASSED'
end

dynamic.quit
