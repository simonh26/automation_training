require 'selenium-webdriver'

class Add_to_button_layout

  def initialize(driver)
    @driver = driver
  end

  def add_page_to_register
    @driver.find_element(xpath: "//li[@class='sub-menu items']").click
    sleep 1
    @driver.find_element(xpath: "//li[@class='js-button-layout']/a").click
    @driver.find_element(id: 'add-button-page').click
    sleep 1
  end

  def add_new_button (button_name)
    page_id = @driver.find_element(xpath: "//a[@class= 'page-tab active']").attribute('data-tab')
    from = @driver.find_element(xpath: "//li[@class='ui-draggable']/span[@class = 'description'][text() = '"+button_name+"']")
    to = @driver.find_element(xpath: "//div[@id='button-page-"+page_id+"']/div[@class='si-placeholder ui-droppable'][1]")

    @driver.action.click_and_hold(from).perform
    sleep 1
    @driver.action.move_to(to).perform
    sleep 1
    @driver.action.release.perform
    sleep 1
  end

end