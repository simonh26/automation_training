class AddModifiers
  def initialize(driver)
    @driver = driver
  end

  def navigate_to_url(text)
    @driver.navigate.to text
  end

  def add_single_choice_group(text)
    @driver.find_element(id: 'add-modifier-group').click
    group_name = @driver.find_element(xpath:"//div[@class='modifier-group-holder']/input")
    group_name.clear
    group_name.send_keys text
  end

  def add_single_choice_option(text)
    option_name = @driver.find_element(xpath:"//div[@class='options-holder']/div[@class='noDrag']/ul[@class='options']/li/input[@class='option-name']")
    option_name.clear
    option_name.send_keys text
  end

  def save_modifiers
    @driver.find_element(id: 'update_modifiers').click
  end

end