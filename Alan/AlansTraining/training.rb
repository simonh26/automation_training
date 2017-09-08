require 'selenium-webdriver'
require_relative 'login'
require_relative 'create_item'
require_relative 'adjust_inventory'
require_relative 'modify_items'
require_relative 'add_to_layout'
require_relative 'search_table'

driver = Selenium::WebDriver.for :chrome
driver.manage.timeouts.implicit_wait = 10
target_size = Selenium::WebDriver::Dimension.new(1500, 1000)
driver.manage.window.size = target_size

item_name = 'another'
name_of_modifier = 'option'

@the_login_screen = Login.new driver
@the_login_screen.navigate_to 'http://www.getshopkeep.com'
@the_login_screen.store_login 'test80936', 'awhitten@shopkeep.com', '$71Great712'
@the_login_screen.commit

# @create_item = Create_item.new driver
# @create_item.add_new_item
# @create_item.name_new_item item_name
# @create_item.commit
#
# @adjust_inventory = Adjust_inventory.new driver
# @adjust_inventory.adjust_inventory
# @adjust_inventory.search_for_item item_name
# @adjust_inventory.update_quantity '10'
# @adjust_inventory.add_quantity
#
# @modify_item = Modify_item.new driver
# @modify_item.search_for_item item_name
# @modify_item.select_item item_name
# @modify_item.name_modifier name_of_modifier
# @modify_item.add_price_to_modifier '10'
# @modify_item.commit

# @add_to_button_layout = Add_to_button_layout.new driver
# @add_to_button_layout.add_page_to_register
# @add_to_button_layout.add_new_button item_name

driver.find_element(xpath: "//li[@class='sub-menu items']").click
driver.find_element(xpath: "//li[@class='js-stock-items']/a").click

# table = driver.find_element(xpath: "//table[@id='DataTables_Table_0']")
#
# text = table.find_element(xpath: "//table[@id='DataTables_Table_0']/tbody/tr[1]/td[@class=' inventory-items-datatable__name']").text
#
# driver.find_element(xpath: "//li[@class='js-stock-items']/a").click
#
# driver.find_elements(xpath: "//table[@id='DataTables_Table_0']/tbody/tr/td[@class=' inventory-items-datatable__name']").each do |r|
#   if r.text == "Empty modifier group" then
#     r.click
#     break
#   end
# end


#@search_table = Search_table.new driver
#@search_table.searchItemsTablePage "Misc Taxable"

#driver.close



# test = [1, 2, 3].map { |n| n * n } #=> [1, 4, 9]
# test


# names = ['danil', 'edmund','paul','harry']
# names.map! {|name| name.capitalize }
# names

# testhash = Hash[names.each_with_indexc.map { |value, index| [(index+1).to_s, value] }]
# testhash

row_array = driver.find_elements(xpath: "//table[@id='DataTables_Table_0']/tbody/tr/td[@class=' inventory-items-datatable__name']")
Alanshash = Hash[row_array.each_with_index.map { |value, index| [(index+1).to_s, value.text] }]

test = Alanshash

test1 = Alanshash.has_value?("glasses")

test2 = Alanshash.key("glasses")

test3 = Alanshash[Alanshash.key("glasses")]

test