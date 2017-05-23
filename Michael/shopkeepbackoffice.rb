require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome
driver.navigate.to 'http://www.getshopkeep.com'

storename = driver.find_element(id: 'store_name')
storename.send_keys 'test46722'

username = driver.find_element(id: 'login')
username.send_keys 'michaelm@shopkeep.com'

password = driver.find_element(id: 'password')
password.send_keys 'M3ldrews!'

# dropdown = driver.find_element(id: 'Business_Category__c')
# select_list = Selenium::WebDriver::Support::Select.new(dropdown)
# select_list.select_by(:text, 'Retail')


button = driver.find_element(id: 'submit')
button.click
driver.quit

