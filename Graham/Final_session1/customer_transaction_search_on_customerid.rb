require 'selenium-webdriver'

class CustomerIDSearch

  def self.signin_to_backoffice
    @driver = Selenium::WebDriver.for :chrome
    @driver.get 'http://www.getshopkeep.com'
    @driver.find_element('id', 'store_name').send_keys('test8986')
    @driver.find_element('id', 'login').send_keys('qatraining@shopkeep.com')
    @driver.find_element('name', 'password').send_keys('password1234')
    @driver.find_element('name', 'commit').click
  end

  signin_to_backoffice
  @driver.get 'https://www.getshopkeep.com/analytics/sales_by/customer'
  customer_transaction_search1 = @driver.find_element('xpath',"//div[@class='ReactVirtualized__Table__rowColumn infinite-table__row-column customer-infinite-table__column--last-name infinite-table__row-column--clickable infinite-table__row-column--fixed']").text

  @driver.get'https://www.getshopkeep.com/customers'
  customer_list_result = @driver.find_elements('xpath',"//tr[@class='click_row']//td[1]").map{|customer_list|customer_list.text}
  result = customer_list_result.include?(customer_transaction_search1)
  puts result

end