require 'page-object'

require 'watir'

class DynamicLoading
  include PageObject

  page_url('http://the-internet.herokuapp.com/dynamic_loading')

  link(:example_first, href: '/dynamic_loading/1')

  link(:example_second, href: '/dynamic_loading/2')

  button(:button_start, text: 'Start')

  h4(:hello_world, text: 'Hello World!')

  def validate_presence obj
    obj.present?
  end

  # def presence_hello_world?
    # self.hello_world_element.present?
  # end

  def perform_opening obj
     obj

     self.button_start

     sleep 6
  end
end

browser = Watir::Browser.new :firefox

dynamic = DynamicLoading.new browser, true

# TESTS

# first link present?
puts dynamic.validate_presence dynamic.example_first_element

#second link present?
puts dynamic.validate_presence dynamic.example_second_element

# opening the first link for hidden element
dynamic.perform_opening dynamic.example_first

# validate presence of hidden element
puts dynamic.validate_presence dynamic.hello_world_element

dynamic.back

# opening the second link for dynamically loading element
dynamic.perform_opening dynamic.example_second

# validate presence of dynamically loaded element
puts dynamic.validate_presence dynamic.hello_world_element

dynamic.quit
