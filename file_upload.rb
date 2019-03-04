require 'page-object'

require 'watir'

class FileUpload
  include PageObject

  page_url('http://the-internet.herokuapp.com/upload')  
end
