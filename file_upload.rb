require 'page-object'

require 'watir'

class FileUpload
  include PageObject

  page_url('http://the-internet.herokuapp.com/upload')
end

browser = Watir::Browser.new :firefox

file_up = FileUpload.new browser, true

file_name = 'lenna.png'

File.write(file_name, '')

path = File.expand_path(file_name)

file_up.file_field(id: 'file-upload').set path


file_up.button(id: 'file-submit').click

sleep 5

file_up.quit
