require 'selenium-webdriver'

class ExamPrep

  @driver = Selenium::WebDriver.for :chrome
  @driver.get 'http://www.getshopkeep.com'
  @driver.find_element('id','store_name').send_keys('test87907')
  @driver.find_element('id','login').send_keys('qatraining@shopkeep.com')
  @driver.find_element('name','password').send_keys('password1234')
  @driver.find_element('name','commit').click

  @driver.get 'https://www.getshopkeep.com/analytics/sales_by/customer'

  @driver.find_element('class', 'date-picker__result__value__main').click
  @driver.find_element('xpath', "//div[@class='quick-selection__button']/div[contains(text(),'This year')]").click
  @driver.find_element('xpath', "//button[@class='button  btn btn-default']").click
  sleep 3
  @driver.find_element('xpath', "//div[@title='Walk-in']").click
  sleep 3
  customer_walk_in_trans = @driver.find_elements('xpath',"//div[@class='ReactVirtualized__Grid ReactVirtualized__Table__Grid infinite-table__grid']//div[@class='ReactVirtualized__Table__rowColumn infinite-table__row-column infinite-table-sales-by-variable-additional-data-table__column--name infinite-table__row-column--fixed infinite-table__row-column--fixed-border']").map{|customer_walk_in_transactions| customer_walk_in_transactions.text}
  puts customer_walk_in_trans
  result = customer_walk_in_trans.include?("Unit Price Item Dept A")
  puts result
end