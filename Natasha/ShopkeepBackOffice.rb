require 'selenium-webdriver'
require_relative 'login'
require_relative 'navigate_sidebar'
require_relative 'create_item'

driver = Selenium::WebDriver.for :chrome
driver.manage.timeouts.implicit_wait = 10

# driver.navigate.to 'http://www.getshopkeep.com'
#
# storename = driver.find_element(id: 'store_name')
# storename.send_keys 'test31814'
#
# login = driver.find_element(id: 'login')
# login.send_keys 'natalia@shopkeep.com'
#
# password = driver.find_element(id: 'password')
# password.send_keys '111111111A'
#
#
# driver.find_element(id: 'submit').click


@login = Login.new driver
@login.navigate_to_url 'http://www.getshopkeep.com'
@login.enter_store_name 'test31814'
@login.enter_username 'natalia@shopkeep.com'
@login.enter_password'111111111A'
@login.click_login_button

@navigate_sidebar = Navigate_sidebar.new driver
@navigate_sidebar.expandParent_clickitemlist

@create_item= CreateItem.new driver
rand_number = rand(1..5000000000)
rand_number_price = rand(1..100)
@create_item.create_item rand_number,rand_number_price,'0',3

#GitHub training test

# driver.find_element(xpath: "//li[@class='sub-menu items']/a").click
# driver.find_element(xpath: "//li[@class='js-stock-items']/a").click

# i = 0
# loop do
#   i += 1
#   puts i
#
# sleep 2
#
# rand_number = rand(1..5000000000)driver.find_element(class: 'add-item').click
#   sleep 2
# driver.switch_to. active_element # switch to modal
# driver.find_element(xpath:"//div[@class='item-type-container basic']/button").click #create item
#
#
# item_description = driver.find_element(id: 'stock_item_description')
# item_description.send_keys "Basic Item" + rand_number.to_s
#
# rand_number_price = rand(1..100)
# item_price = driver.find_element(id: 'stock_item_price')
# item_price.clear
# item_price.send_keys rand_number_price.to_s
#
# taxable = driver.find_element(id: 'stock_item_taxable')
# select_list = Selenium::WebDriver::Support::Select.new(taxable)
# select_list.select_by(:value, '0')
#
# driver.find_element(id: 'stock_item_submit').click
#
# driver.find_element(id: 'notice').text.include? 'Item was successfully created.'
#
#
#   if i == 1
#     break
#   end
#
# end

#Adjust Inventory for item Basic Item1 and check that it was adjusted
# driver.navigate.to 'https://www.getshopkeep.com/mobile/take-inventory'
# item_input_inv = driver.find_element(id: 'item_input')
# item_input_inv.clear
# item_input_inv.send_keys "Basic Item1"
# sleep 2
# item_input_inv.send_keys :enter
#
# adj_quantity = driver.find_element(id: 'quantity_input')
# adj_quantity.clear
# adj_quantity.send_keys "10"
#
# driver.find_element(id: 'add_to_count').click
#
# driver.find_element(id:'current').text.include? '10 (+ 0 in kits)'


# driver.navigate.to 'https://www.getshopkeep.com/stock_items/18211156/modifiers'
# # search_field = driver.find_element(xpath:"//div[@class='stock_item_search']/div[@id='DataTables_Table_0_filter']/label/input")
# # search_field.click
# # search_field.send_keys "Basic Item1"
#
# driver.find_element(id: 'add-modifier-group').click
#
# group_name = driver.find_element(xpath:"//div[@class='modifier-group-holder']/input")
# group_name.clear
# group_name.send_keys "Single Choice"
#
# option_name = driver.find_element(xpath:"//div[@class='options-holder']/div[@class='noDrag']/ul[@class='options']/li/input[@class='option-name']")
# option_name.clear
# option_name.send_keys "Test1"
#
# driver.find_element(xpath:"//div[@class='options-holder']/div[@class='noDrag']/a[@class='add-option show-text push-left']").click
#
# another_option = driver.find_element(xpath:"//div[@class='options-holder']/div/ul[@class='options ui-sortable']/li[2]/input[@class='option-name']")
# another_option.clear
# another_option.send_keys "Test2"
#
# driver.find_element(id: 'update_modifiers').click
#
# #driver.find_element(:link, 'Additional Details').click- click on Additional Details tab

test

