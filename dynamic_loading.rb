require 'page-object'

require 'watir'

class DynamicLoading
  include PageObject

  page_url('http://the-internet.herokuapp.com/dynamic_loading')

  link(:example_first, href: '/dynamic_loading/1')

  link(:example_second, href: '/dynamic_loading/2')
end

browser = Watir::Browser.new :firefox

dynamic = DynamicLoading.new browser, true

sleep 2

puts dynamic.example_first_element.present?


puts dynamic.example_second_element.present?


dynamic.example_first


sleep 2


dynamic.div(id: 'start').button.click


sleep 10

puts dynamic.h4(text: 'Hello World!').present?


dynamic.back


dynamic.example_second


dynamic.div(id: 'start').button.click

sleep 5

puts dynamic.h4(text: 'Hello World!').present?

sleep 5

dynamic.quit
