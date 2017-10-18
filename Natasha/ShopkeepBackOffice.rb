require 'selenium-webdriver'
require_relative 'login'
require_relative 'navigate_sidebar'
require_relative 'create_item'
require_relative 'adjust_inventory'
require_relative 'add_modifiers'

driver = Selenium::WebDriver.for :chrome
driver.manage.timeouts.implicit_wait = 10


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

@adjust_inventory= AdjustInventory.new driver
@adjust_inventory.navigate_to_url  'https://www.getshopkeep.com/mobile/take-inventory'
@adjust_inventory.enter_item_name  'Basic Item1'
@adjust_inventory.adjust_quantity  '20'
@adjust_inventory.click_add_count
@adjust_inventory.check_message  '20 (+ 0 in kits)'

@add_modifiers= AddModifiers.new driver
@add_modifiers.navigate_to_url  'https://www.getshopkeep.com/stock_items/18211156/modifiers'
@add_modifiers.add_single_choice_group 'Single Choice Group Test'
@add_modifiers.add_single_choice_option 'Test1'
@add_modifiers.save_modifiers

#test

