#ruby test.rb
require "selenium-webdriver"

options = Selenium::WebDriver::Firefox::Options.new
options.binary = "/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/bin/firefox"  # Path to Firefox in Flatpak

driver = Selenium::WebDriver.for :firefox, options: options
driver.get "http://www.firefox.com"
puts driver.title
driver.quit

