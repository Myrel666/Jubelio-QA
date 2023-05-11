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

# element = @@driver.find_element(:xpath => "//button[@type='submit' and contains(text(),'Masuk')]");
element = @@driver.find_element(:xpath => "//button[@type='submit' and span[text() = 'Masuk']]").click;
# element = @@driver.find_element(:xpath => "//button[@type=\"submit\" and contains(text(),'Masuk')]");
wait = Selenium::WebDriver::Wait.new(timeout: 30);
wait.until { @@driver.find_element(:xpath => "//a[@href='/home']") };



# WebElement elesendKeys = @@driver.findElement(By.NAME, "email");
# elesendKeys = @@driver.findElement(name: "email");
# WebElement elesendKeys = @@driver.findElement(name: "email");
# input_element = driver.find_element(:name, "nama-atribut")
# WebElement elesendKeys = driver.findElement(By.id("TextBox"));

# elesendKeys.sendKeys("qa.rakamin.jubelio@gmail.com");
# WebElement elesendKeys = driver.findElement(By.NAME("password"));
# elesendKeys.sendKeys("elesendKeys.sendKeys("qa.rakamin.jubelio@gmail.com");");
# element = @@driver.find_element(:xpath => "//*[@type='submit' and contains(text(),'Login')]")
# # Find the element using driver object
# # element = @@driver.find_element(:xpath => "//*[@class='checkmark' and contains(text(),'Apple')]")
# wait = Selenium::WebDriver::Wait.new(timeout: 30)
# # Wait until the element is displayed
# wait.until { element.displayed? }
# @@driver.find_element(:xpath =>  "//*[@type='submit' and contains(text(),'Login')]").click
# @@driver.find_element(:xpath => "//*[@class='checkmark' and contains(text(),'Apple')]").click
# Wait for the condition
# wait.until { @@driver.find_element(:css, ".products-found span").text == "9 Product(s) found." }
# actualValue = @@driver.find_element(:css, ".products-found span").text
# Assert the expected text with actual text
# assert_equal(actualValue, "9 Product(s) found.")
end

def teardown
# Quit the driver
@@driver.quit
end

end