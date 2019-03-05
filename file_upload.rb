require 'page-object'

require 'watir'

class FileUpload
  include PageObject

  page_url('http://the-internet.herokuapp.com/upload')

  button(:file_submit, id: 'file-submit')

  h3(:file_uploaded, text: 'File Uploaded!')
end

browser = Watir::Browser.new :firefox

file = FileUpload.new browser, true

file_name = 'lenna.png'

File.write(file_name, '')

path = File.expand_path(file_name)

file.file_field(id: 'file-upload').set path

file.file_submit

p file.file_uploaded

file.quit
