### Signup form for a typical page object
class SignupPage

### css selectors
USERNAME_FIELD = {id: "user_username"}
EMAIL_FIELD  = {id: "user_email"}
PASSWORD_FIELD = {id: "user_password"}
SUBMIT_BUTTON = {id: "submit"}

# webdriver instance variable can be created in
# the test, but used throughout the class
attr_reader :driver

### class methods
# constructor
def initialize(driver)
  @driver = driver
end

def enter_username(username)
  username_field = @driver.find_element(USERNAME_FIELD)
  username_field.send_keys(username)
end

def enter_email(email)
  email_field = @driver.find_element(EMAIL_FIELD)
  email_field.send_keys(email)
end

def enter_password(password)
  password_field = @driver.find_element(PASSWORD_FIELD)
  password_field.send_keys(password)
end

def submit_form()
  submit_button = @driver.find_element(SUBMIT_BUTTON)
  submit_button.click
end

end