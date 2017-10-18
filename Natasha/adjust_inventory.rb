class AdjustInventory

  def initialize(driver)
    @driver = driver
  end

  def navigate_to_url(text)
    @driver.navigate.to text
  end

  def enter_item_name(text)
    item_input_inv = @driver.find_element(id: 'item_input')
    item_input_inv.clear
    item_input_inv.send_keys text
    sleep 2
    item_input_inv.send_keys :enter
  end

  def adjust_quantity(text)
     adj_quantity = @driver.find_element(id: 'quantity_input')
     adj_quantity.clear
     adj_quantity.send_keys text
  end

  def click_add_count
    @driver.find_element(id: 'add_to_count').click
  end

  def check_message(text)
    @driver.find_element(id:'current').text.include? text
  end
  end