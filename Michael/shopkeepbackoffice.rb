require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome
driver.manage.timeouts.implicit_wait = 10
driver.navigate.to 'http://www.getshopkeep.com'

rand_number = rand(1..5000000000)
mikes_item = 'Doner Kebab' + rand_number.to_s


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

#main menu items
#$x("//li[@class='js-stock-items']")
driver.find_element(xpath: "//li[@class='sub-menu items']/a").click
driver.find_element(xpath: "//li[@class='js-stock-items']/a").click

driver.navigate.to 'https://www.getshopkeep.com/stock_items'
driver.find_element(class: 'add-item').click

driver.switch_to. active_element # switch to modal
driver.find_element(xpath:"//div[@class='item-type-container basic']/button").click #create item

# driver.switch_to. active_element # switch to modal
# driver.find_element(xpath:"//div[@class='item-type-container variants']/button").click #create variant

# driver.navigate.to 'https://www.getshopkeep.com/stock_items/new'

itemname = driver.find_element(id: 'stock_item_description')
itemname.send_keys mikes_item

itemprice = driver.find_element(id: 'stock_item_price')
itemprice.clear
itemprice.send_keys ('6.49')

taxable = driver.find_element(id: 'stock_item_taxable')
select_list = Selenium::WebDriver::Support::Select.new(taxable)
select_list.select_by(:value, '0')



submititem = driver.find_element(id: 'stock_item_submit')
submititem.click

driver.find_element(id: 'notice').text.include? 'Item was successfully created.'

# driver.find_element(xpath:"//a[@class='adjust-quantity']").click
driver.navigate.to 'https://www.getshopkeep.com/mobile/take-inventory'
adjust = driver.find_element(id: 'item_input')
adjust.clear
sleep(10)

adjust.send_keys mikes_item
sleep(5)
# adjust.send_keys :arrow_down
adjust.send_keys :enter
quantity = driver.find_element(id:'quantity_input')
quantity.send_keys '10'
driver.find_element(id:'add_to_count').click
driver.find_element(id:'current').text.include? '10 (+ 0 in kits)'

driver.quit

