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
require "rspec"
require_relative "signup_page.rb"
require_relative "users_page.rb"

options = Selenium::WebDriver::Firefox::Options.new
# For flatpak (ugh!)...
options.binary = "/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/bin/firefox"

timestamp = Time.now.to_i # randomize the username for a unique user signup
username = "user#{timestamp}"
email = "#{username}@test.com"
password = "insecure"
expected_banner_text = "Welcome to the alpha blog #{username}"

# TEST: Sign up for a blog
describe "Blog application" do
  describe "Signup to the blog application" do

    it "Confirm that a user can successfully sign up" do
      # Use :remote and options:: for remote execution on the Grid
      options = Selenium::WebDriver::Firefox::Options.new
      options.binary = "/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/bin/firefox"

      # grid tests
      #@driver = Selenium::WebDriver.for :remote, url: "http://localhost:4444/wd/hub", options: options

      # local tests
      @driver = Selenium::WebDriver.for :firefox, options: options

      @driver.get 'https://selenium-blog.herokuapp.com/signup'

      signup = SignupPage.new(@driver)
      # Submit account entry form
      signup.enter_username(username)
      signup.enter_email(email)
      signup.enter_password(password)
      signup.submit_form()

      # Verify user was added successfully by checking for success banner text
      users = UsersPage.new(@driver)
      banner_text = users.get_banner_text()
      expect(banner_text).to eq(expected_banner_text)

      @driver.quit
    end # it
  end # test
end # describe
