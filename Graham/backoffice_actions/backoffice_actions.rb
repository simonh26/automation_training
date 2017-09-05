require 'selenium-webdriver'
require 'pry'

class BackofficeActions
 def login_to_backoffice(store_name)

   @driver = Selenium::WebDriver.for :chrome
   @driver.get 'http://www.getshopkeep.com'
   @driver.find_element('id','store_name').send_keys(store_name)
   @driver.find_element('id','login').send_keys('qatraining@shopkeep.com')
   @driver.find_element('name','password').send_keys('password1234')
   @driver.find_element('name','commit').click
 end

 def navigate_to_transactions
   @driver.get 'http://www.getshopkeep.com/transactions'
 end

 def driver_quit
   @driver.quit
 end

 def navigate_to_printer_groups_screen
   @driver.get 'https://www.getshopkeep.com/printers'
 end

 def get_mac_printer_settings
   list = @driver.find_elements('xpath', "//div[@class='content-panel printers-panel']//div[@aria-label='row']//div[@class='ReactVirtualized__Table__rowColumn infinite-table__row-column printers-table__column--mac-address']").map{|mac_printer_result| mac_printer_result.text}
   list.reject { |c| c.empty? }
 end

def navigate_to_add_new_printer
  @driver.get 'https://www.getshopkeep.com/printers/new'
end

 def add_new_printer(printer_name,mac_address)
   @driver.find_element('xpath',"//input[@label='Name']").send_keys(printer_name)
   @driver.find_element('xpath',"//input[@label='MAC Address']").send_keys(mac_address)
   @driver.find_element('xpath',"//button[@class='button  btn btn-default']").click
 end

  def change_transation_date_range(range)
    @driver.find_element('class', 'date-picker__result__value__main').click
    @driver.find_element('xpath', "//div[@class='quick-selection__button']/div[contains(text(),'#{range}')]").click
    @driver.find_element('xpath', "//button[@class='button  btn btn-default']").click
  end

  def verify_transaction(store_name)
    login_to_backoffice store_name
    navigate_to_transactions
    change_transation_date_range('This year')
    sleep 2

    get_transaction_receipt '17536015508031710001', '08/03/17, 8:50 AM 155 Manager Manager sale 189.00 0.00 13.40 202.40'
    # all_transactions = @driver.find_elements('xpath',"//tbody//tr").map{|transaction| transaction.text}
    # test = all_transactions.any?{|string| string.include?('100.00 0.00 0.00 100.00')}
    # puts test

  end

  def get_transaction_receipt(receipt_number, returned_data)
    transaction = @driver.find_elements('xpath',"//tr[@data-receipt-number='#{receipt_number}']").map{|transaction_result| transaction_result.text}
    test = transaction.include?(returned_data)
    puts test
  end
end