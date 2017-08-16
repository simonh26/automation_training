require 'selenium-webdriver'
require 'pry'

class TransactionSearch
 def login_to_backoffice

   @driver = Selenium::WebDriver.for :chrome
   @driver.get 'http://www.getshopkeep.com'
   @driver.find_element('id','store_name').send_keys('test-mcdoo-store')
   @driver.find_element('id','login').send_keys('qatraining@shopkeep.com')
   @driver.find_element('name','password').send_keys('password1234')
   @driver.find_element('name','commit').click

 end

 def navigate_to_transactions
 @driver.get 'http://www.getshopkeep.com/transactions'
 end

  def change_transation_date_range(range)
    @driver.find_element('class', 'date-picker__result__value__main').click
    @driver.find_element('xpath', "//div[@class='quick-selection__button']/div[contains(text(),'#{range}')]").click
    @driver.find_element('xpath', "//button[@class='button  btn btn-default']").click
  end

  def verify_transaction
    login_to_backoffice
    navigate_to_transactions
    change_transation_date_range('This year')

    sleep 2

    get_transaction_receipt '17536015508031710001', '08/03/17, 8:50 AM 155 Manager Manager sale 189.00 0.00 13.40 202.40'
    # all_transactions = @driver.find_elements('xpath',"//tbody//tr").map{|transaction| transaction.text}
    # test = all_transactions.any?{|string| string.include?('100.00 0.00 0.00 100.00')}
    #
    # puts test

  end

  def get_transaction_receipt(receipt_number, returned_data)
    transaction = @driver.find_elements('xpath',"//tr[@data-receipt-number='#{receipt_number}']").map{|transaction_result| transaction_result.text}
    test = transaction.include?(returned_data)
    puts test
  end
end