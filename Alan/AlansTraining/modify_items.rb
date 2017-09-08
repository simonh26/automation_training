require 'selenium-webdriver'

class Modify_item

  def initialize(driver)
    @driver = driver
  end

  def search_for_item (name)
    @driver.find_element(xpath: "//li[@class='js-stock-items']/a").click
    @driver.find_element(xpath: "//div[@id='DataTables_Table_0_filter']//input").send_keys name
  end

  def select_item (name)
    @driver.find_element(xpath: "//td[contains(text(), '"+name+"')]").click
    @driver.find_element(xpath: "//div[@class='tabs new']//a[contains(text(), 'Modifiers')]").click
    @driver.find_element(xpath: "//div[@id = 'ModifierMultiGroupCollectionView-additional']//a[@class='add-option show-text']").click
  end

  def name_modifier (modifier_name)
    name = @driver.find_element(xpath: "//li/input[@class='option-name']")
    name.clear
    name.send_keys modifier_name
  end

  def add_price_to_modifier (price)
    add_price = @driver.find_element(xpath: "//li/input[@class='option-value']")
    add_price.clear
    add_price.send_keys price
  end

  def commit
    @driver.find_element(id: 'update_modifiers').click
  end
end