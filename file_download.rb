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
    p "Test 4.1: type #{type}"
    Dir["temp/*"].each do |file|
      if file.match type
        puts " Correct type of #{file}. is PASSED"
      else
        puts " Incorrect type of #{file}.is NOT PASSED"
      end
    end
  end

  def remove_downloads
    FileUtils.rm_rf('temp/')
  end
end

download_directory = "#{Dir.pwd}/temp"
download_directory.tr!('/', '\\') if Selenium::WebDriver::Platform.windows?

profile = Selenium::WebDriver::Firefox::Profile.new

profile['browser.download.folderList'] = 2 # custom location

profile['browser.download.dir'] = download_directory

profile['browser.helperApps.neverAsk.saveToDisk'] = 'application/octet-stream'

browser = Watir::Browser.new :firefox, profile: profile



download = FileDownload.new browser, true

download.perform_downloads '.txt'

sleep 5

# TEST

# Are the type of each file - 'txt'?
download.validate_downloaded_types '.txt'

# cleanup the temp folder with downloaded files
download.remove_downloads

download.quit
