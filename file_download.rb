require 'page-object'

require 'watir'

require 'fileutils'

class FileDownload
  include PageObject

  page_url('http://the-internet.herokuapp.com/download')

  def perform_downloads type
    self.links.each do |link|
      if link.href.match? type

        link.click
      end
    end
  end

  def validate_downloaded_types type
    Dir["temp/*"].each do |file|
      if file.match type
        puts true
      else
        puts false
      end
    end
  end

  def remove_files
    FileUtils.rm_rf('temp/')
  end
end

prefs = {
  download: {
    prompt_for_download: false,
    default_directory: './temp'
  }
}

browser = Watir::Browser.new :chrome, options: { prefs: prefs }

download = FileDownload.new browser, true

download.perform_downloads '.txt'

sleep 5

download.validate_downloaded_types '.txt'

download.remove_files

download.quit
