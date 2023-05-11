require "selenium-webdriver"
require "test/unit"

class SeleniumRubyTest < Test::Unit::TestCase
@@driver

def setup
# create Driver object for Chrome
@@driver = Selenium::WebDriver.for :chrome
# Navigate to URL
@@driver.navigate.to "https://app.jubelio.com/login/"
end

def test_login
@@driver.manage.timeouts.implicit_wait = 10 # seconds
elesendKeys = @@driver.find_element(name: "email");
elesendKeys.send_keys("qa.rakamin.jubelio@gmail.com");

elesendKeys = @@driver.find_element(name: "password");
elesendKeys.send_keys("Jubelio123!");


element = @@driver.find_element(:xpath => "//button[@type='submit' and span[text() = 'Masuk']]").click;

wait = Selenium::WebDriver::Wait.new(timeout: 30);
wait.until { @@driver.find_element(:xpath => "//a[@href='/home']") };

@@driver.navigate.to "https://app.jubelio.com/home/inventory"

element = @@driver.find_element(:xpath => "//button[@class='ladda-button btn btn-primary m-l-xs' and span[text() = 'Penyesuaian Persediaan']]").click;

end

def teardown
# Quit the driver
@@driver.quit
end

end 