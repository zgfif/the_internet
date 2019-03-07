require 'page-object'

# require 'watir'

class DragAndDrop
  include PageObject

  page_url('http://the-internet.herokuapp.com/drag_and_drop')

  div(:a_div, id: 'column-a')

  div(:b_div, id: 'column-b')

  def replace id1, id2
    a = browser.div(id: id1)

    b = browser.div(id: id2)

    a.drag_and_drop_on b
  end

  def validate_order
    self.elements(class: 'column')[0].text == 'B'
  end
end

browser = Watir::Browser.new :firefox

drag = DragAndDrop.new browser, true

# TESTS

# validation the presence of 'A' div
puts drag.a_div_element.present?

# validation the presence of 'B' div
puts drag.b_div_element.present?

sleep 1

# drag A on B and drop
drag.replace 'column-a', 'column-b'

sleep 2

# validation order of A and B div
puts drag.validate_order

drag.quit
