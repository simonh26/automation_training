require 'selenium-webdriver'

class Login

  def initialize(driver)
    @driver = driver
  end

  def store_login (store_name, username, password)
    enter_store_name (store_name)
    enter_username (username)
    enter_password (password)
  end

  def enter_store_name(store_name)
    @driver.find_element(name: 'store_name').send_keys store_name
  end

  def enter_username (username)
    @driver.find_element(name: 'login').send_keys username
  end

  def enter_password (password)
    @driver.find_element(name: 'password').send_keys password
  end

  def navigate_to (url)
    @driver.navigate.to url
  end

  def commit
    @driver.find_element(name: 'commit').click
  end

end