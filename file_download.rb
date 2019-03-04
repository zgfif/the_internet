require 'page-object'

require 'watir'

class FileDownload
  include PageObject

  page_url('http://the-internet.herokuapp.com/download')
end

prefs = {
  download: {
    prompt_for_download: false,
    default_directory: './temp'
  }
}

browser = Watir::Browser.new :chrome, options: { prefs: prefs }

download = FileDownload.new browser, true

download.links.each do |link|
  if link.href.match? /.txt/
    link.click
  end
end

download.quit
