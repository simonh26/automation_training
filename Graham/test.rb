require 'selenium-webdriver'

class TestingSeleniumSignUp
  driver = Selenium::WebDriver.for:chrome
  driver.get "https://signup.com/volunteerspot/sign-up-form"
  driver.find_element('class','vs1-largebtn3').click
  sleep 5
  driver.find_element('id','register-fname').send_keys('TEST1234')
  driver.find_element('id','register-lname').send_keys('LName TEST 1234')
  driver.find_element('id','register-email').send_keys('Email@test1234.com')
  driver.find_element('id','register-password').send_keys('PaSsWoRd1234!')
  driver.find_element('xpath',"//button[@type='submit']").click
  sleep 5
end
