# Install packages: bundle install
# Execute test: rspec blog-test.rb
#
# NOTE: hard-coded for Debian Firefox flatpak install
#
# WebDriver is configured to run on a Selenium Grid:
# :remote - execute tests remotely
# options: - can be used to specify
#   the required test properties (browser name, version, platform)
#

require "selenium-webdriver"
options = Selenium::WebDriver::Firefox::Options.new
# For flatpak (ugh!)...
options.binary = "/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/bin/firefox"

require "rspec"

timestamp = Time.now.to_i # randomize the username for a unique user signup
username = "user#{timestamp}"
email = "#{username}@test.com"
password = "insecure"

# TEST: Sign up for a blog
describe "Blog application" do
  describe "Signup to the blog application" do

    it "Confirm that a user can successfully sign up" do
      # Use :remote and options:: for remote execution on the Grid
      options = Selenium::WebDriver::Firefox::Options.new
      options.binary = "/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/bin/firefox"

      # grid tests
      #driver = Selenium::WebDriver.for :remote, url: "http://localhost:4444/wd/hub", options: options

      # local tests
      driver = Selenium::WebDriver.for :firefox, options: options

      driver.get 'https://selenium-blog.herokuapp.com/signup'

      username_field = driver.find_element(id: "user_username")
      username_field.send_keys(username)

      email_field = driver.find_element(id: "user_email")
      email_field.send_keys(email)

      password_field = driver.find_element(id: "user_password")
      password_field.send_keys(password)

      # Submit
      submit_button = driver.find_element(id: "submit")
      submit_button.click

      # Verify user was added successfully by checking for success banner text
      banner = driver.find_element(id: "flash_success")
      banner_text = banner.text
      expect(banner_text).to eq("Welcome to the alpha blog #{username}")

      driver.quit
    end # it
  end # test
end # describe
