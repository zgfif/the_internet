require 'page-object'

require 'watir'

class DragAndDrop
  include PageObject

  page_url('http://the-internet.herokuapp.com/drag_and_drop')

  def has_div? uniq_id
   self.div(id: uniq_id).present?
  end

  def replace id1, id2
    id1 = self.div(id: id1)

    id2 = self.div(id: id2)

    # id1.drag_and_drop_on id2
  end
end

browser = Watir::Browser.new :firefox

drag = DragAndDrop.new browser, true

# TESTS

p drag.has_div? 'column-a' # validation the presence of 'A' div

p drag.has_div? 'column-b' # validation the presence of 'B' div

sleep 5

drag.replace 'column-a', 'column-b'

drag.quit
