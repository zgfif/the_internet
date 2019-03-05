require 'page-object'

require 'watir'

class Hover
  include PageObject

  page_url('http://the-internet.herokuapp.com/hovers')

  div(:first_img, class: 'figure', index: 0)

  div(:second_img, class: 'figure', index: 1)

  div(:third_img, class: 'figure', index: 2)
end

browser = Watir::Browser.new :firefox

hover_page = Hover.new browser, true

hover_page.first_img_element.hover

sleep 2

hover_page.second_img_element.hover

sleep 2

hover_page.third_img_element.hover

sleep 2

hover_page.quit
