require 'selenium-webdriver'

class Create_item

  def initialize(driver)
    @driver = driver
  end

  def add_new_item
    @driver.find_element(xpath: "//li[@class='sub-menu items']").click
    @driver.find_element(xpath: "//li[@class='js-stock-items']/a").click
    @driver.find_element(xpath: "//a[@class='add-item']").click
    @driver.find_element(xpath: "//div[@class='item-type-container basic']/button[@class='button button-alt btn btn-default']").click
  end

  def name_new_item (new_item)
    @driver.first(xpath: "//input[@id='stock_item_description']").send_keys new_item
  end

  def commit
    @driver.find_element(name: 'commit').click
  end
end