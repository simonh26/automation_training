require 'selenium-webdriver'
#require 'spec_helper'
require 'pry'

class Login

  def click_and_drag(source, target, x_offset=0, y_offset=0)
    source = source.element unless source.class == Selenium::WebDriver::Element
    target = target.element unless target.class == Selenium::WebDriver::Element
    @driver.action.click_and_hold(source).move_to(target, x_offset, y_offset).release.perform
  end

  driver = Selenium::WebDriver.for :chrome
  driver.get 'http://www.getshopkeep.com'
  driver.find_element('id','store_name').send_keys('test64765')
  driver.find_element('id','login').send_keys('qatraining@shopkeep.com')
  driver.find_element('name','password').send_keys('password1234')
  driver.find_element('name','commit').click
  driver.get'https://www.getshopkeep.com/stock_items/new'
  driver.find_element('id','stock_item_description').send_keys('Test Item A')

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

  driver.get'https://www.getshopkeep.com/ipad-layout'
  driver.find_element('xpath',"//span[contains(., 'Page 3')]").click
  source=driver.find_element('xpath', "//span[contains(., 'Test Item A')]")
  destination= driver.find_element('xpath', "//div[@class='button_page']/div[@class='si-placeholder ui-droppable'][8]")
  driver.action.click_and_hold(source).move_to(destination).release.perform
  sleep 5
  puts 'TESTESTTEST'
end