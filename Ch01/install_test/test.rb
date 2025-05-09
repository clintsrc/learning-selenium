#
# Install packages: bundle install
# Execute test: ruby test.rb
#
# NOTE: hard-coded for Debian Firefox flatpak install
# This is a basic script I used to strip down the install and
# troubleshoot issues running it on Debian using a Firefox
# flatpak install. There are also a couple of differences with
# new selenium versions that have been simplfied since the tutorial
# was written (eg. webdrivers are included with selenium 4.10+)
#

require "selenium-webdriver"

options = Selenium::WebDriver::Firefox::Options.new
options.binary = "/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/bin/firefox"  # Path to Firefox in Flatpak

driver = Selenium::WebDriver.for :firefox, options: options
driver.get "http://www.firefox.com"
puts driver.title
driver.quit

