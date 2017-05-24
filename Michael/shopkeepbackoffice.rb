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

driver.navigate.to 'https://www.getshopkeep.com/stock_items/new'

itemname = driver.find_element(id: 'stock_item_description')
itemname.send_keys 'Doner Kebab 6'

itemprice = driver.find_element(id: 'stock_item_price')
itemprice.clear
itemprice.send_keys ('6.49')

taxable = driver.find_element(id: 'stock_item_taxable')
select_list = Selenium::WebDriver::Support::Select.new(taxable)
select_list.select_by(:value, '0')



submititem = driver.find_element(id: 'stock_item_submit')
submititem.click

driver.find_element(id: 'notice').text.include? 'Item was successfully created.'

driver.quit

