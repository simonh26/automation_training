require 'selenium-webdriver'
#require 'spec_helper'

class Login
  driver = Selenium::WebDriver.for :chrome
  driver.get 'http://www.getshopkeep.com'
  driver.find_element('id','store_name').send_keys('test-mcdoo-store')
  driver.find_element('id','login').send_keys('test')
  driver.find_element('name','password').send_keys('test')
  driver.find_element('name','commit').click
  driver.get'https://www.getshopkeep.com/stock_items/new'
  driver.find_element('id','stock_item_description').send_keys('Test Item123')

  # @helpers.select_dropdown('stock_item_category_id', 'value')
  dropDownMenu = driver.find_element(:id, 'stock_item_department_id')
  option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
  option.select_by(:text, 'DeptA')

  dropDownMenu = driver.find_element(:id, 'stock_item_category_id')
  option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
  option.select_by(:text, 'general')

  dropDownMenu = driver.find_element(:id, 'stock_item_price_type')
  option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
  option.select_by(:text, 'In BackOffice')

  driver.find_element('id','stock_item_price').clear
  driver.find_element('id','stock_item_price').send_keys('19.99')

  driver.find_element('id','stock_item_submit').click

  puts 'ndkjasndjan'

end