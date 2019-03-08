require 'page-object'

require 'watir'

class FileUpload
  include PageObject

  page_url('http://the-internet.herokuapp.com/upload')

  button(:file_submit, id: 'file-submit')

  h3(:file_uploaded, text: 'File Uploaded!')

  file_field(:the_file, id: 'file-upload')

  div(:uploaded_files, id: 'uploaded-files')

  def upload_file file_name
    File.write(file_name, '')

    path = File.expand_path(file_name)

    self.the_file_element.set path

    self.file_submit
  end

  def valid_uploaded_file? file_name
    self.uploaded_files == file_name
  end
end

browser = Watir::Browser.new :firefox

file = FileUpload.new browser, true

file.upload_file 'watir_example.txt'

# TESTS

# successful uploading?
p file.file_uploaded

# correct file?
p file.valid_uploaded_file? 'watir_example.txt'

file.quit
