class Navigate_sidebar

  def initialize(driver)
    @driver = driver
  end

  def expand_items_menu
    @driver.find_element(xpath: "//li[@class='sub-menu items']/a").click
  end

  def click_items_list
    @driver.find_element(xpath: "//li[@class='js-stock-items']/a").click
  end

  #wrapper method

  def expandParent_clickitemlist
    expand_items_menu
    click_items_list
  end
end