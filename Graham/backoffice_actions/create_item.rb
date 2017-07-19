require 'selenium-webdriver'
require 'pry'

class BackofficeActions
  def signin_to_backoffice

    @driver = Selenium::WebDriver.for :chrome
    @driver.get 'http://www.getshopkeep.com'
    @driver.find_element('id','store_name').send_keys('test64765')
    @driver.find_element('id','login').send_keys('qatraining@shopkeep.com')
    @driver.find_element('name','password').send_keys('password1234')
    @driver.find_element('name','commit').click
  end

  def create_new_item_backoffice(stock_item, price)
    signin_to_backoffice
    @driver.get'https://www.getshopkeep.com/stock_items/new'
    item_increment = rand(100).to_s
    @driver.find_element('id','stock_item_description').send_keys stock_item+item_increment

    # @helpers.select_dropdown('stock_item_category_id', 'value')
    dropDownMenu = @driver.find_element(:id, 'stock_item_department_id')
    option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
    option.select_by(:text, 'DeptA')

    dropDownMenu = @driver.find_element(:id, 'stock_item_category_id')
    option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
    option.select_by(:text, 'general')

    dropDownMenu = @driver.find_element(:id, 'stock_item_price_type')
    option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
    option.select_by(:text, 'In BackOffice')

    @driver.find_element('id','stock_item_price').clear
    @driver.find_element('id','stock_item_price').send_keys price

    @driver.find_element('id','stock_item_submit').click
    @driver.quit 
  end
end