### Users page for a typical page object
class UsersPage

### css selectors
SUCCESS_BANNER = {id: "flash_success"}

# webdriver instance variable can be created in
# the test, but used throughout the class
attr_reader :driver

### class methods
# constructor
def initialize(driver)
  @driver = driver
end

def get_banner_text()
  banner = @driver.find_element(SUCCESS_BANNER)
  banner.text
end

end