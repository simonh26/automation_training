require 'selenium-webdriver'
require 'pry'

class BackOfficeSignIn
 def self.admin_signin_backoffice(*store_names)
    # Navigate to the webpage, select StoreName, Username/Email and Password
    store_names.each do |store_name|
     @driver = Selenium::WebDriver.for :chrome
     @driver.get 'http://www.getshopkeep.com'
     @driver.find_element('id', 'store_name').send_keys(store_name)
     @driver.find_element('id', 'login').send_keys('qatraining@shopkeep.com')
     @driver.find_element('name', 'password').send_keys('password1234')
     @driver.find_element('name', 'commit').click
     @driver.quit
   end
 end

 admin_signin_backoffice'admin','test-mcdoo-store'

    # def backoffice_store_name_search
    # search for the Store name search bar, Enter the test store test64765 and select the search button
    @driver.find_element('id', 'search_params_by_subdomain').send_keys('test64765')
    @driver.find_element('name', 'commit').click
    # end

    # def enable_additonal_settings_feature_flag
    # find additional settings and
    @driver.find_element('id', 'features_panel').click

    if @driver.find_elements('xpath', "//div[@class='feature-row']//label[contains(., 'Ticket printer groups')]/../../..//input[@class='button enable-feature']").any? == true
      @driver.find_element('xpath', "//div[@class='feature-row']//label[contains(., 'Ticket printer groups')]/../../..//input[@type='submit']").click
    else
      puts 'whatever'
    end

    # end

  end

