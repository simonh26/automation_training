class Login

  def initialize(driver)
    @driver = driver
  end

  def navigate_to_url(text)
    @driver.navigate.to text
  end

  def enter_store_name(text)
    storename = @driver.find_element(id: 'store_name')
    storename.send_keys text
  end

  def enter_username(text)
    login = @driver.find_element(id: 'login')
    login.send_keys text
  end

  def enter_password(text)
    password = @driver.find_element(id: 'password')
    password.send_keys text
  end

  def click_login_button
    @driver.find_element(id: 'submit').click
  end

end



