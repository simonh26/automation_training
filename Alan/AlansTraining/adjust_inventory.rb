require 'selenium-webdriver'

class Adjust_inventory

  def initialize(driver)
    @driver = driver
  end

  def adjust_inventory
    @driver.find_element(xpath: "//li[@class='sub-menu items']").click
    sleep 1
    @driver.find_element(xpath: ".//*[@id='stock_items-edit_additional_details']//a[contains(text(), 'Adjust Inventory')]").click
  end

  def search_for_item (item_name)
    search_box = @driver.find_element(xpath: "//input[@id='item_input']")
    text = item_name
    for i in 0..text.length
      c = text[i]
      search_box.send_keys c
      sleep 1
    end
    search_box.send_keys :return
  end

  def update_quantity (quantity)
    @driver.find_element(id: 'quantity_input').send_keys quantity
  end

  def add_quantity
    @driver.find_element(id: 'add_to_count').click
    sleep 1
  end
end