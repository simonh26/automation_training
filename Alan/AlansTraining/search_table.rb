require 'selenium-webdriver'

class Search_table

  def initialize(driver)
    @driver = driver
  end

  def searchItemsTablePage(itemName)
    page = 1
    begin
      found_item = searchForItemAndClick(itemName)
      if found_item == false
        page += 1
        @driver.find_element(xpath: "//*[@id='DataTables_Table_0_wrapper']/div[6]/span/a[text() = #{page}]").click
        sleep 2
      end
    end while found_item == false
  end

  def searchForItemAndClick(itemName)
    found = false
    @driver.find_elements(xpath: "//table[@id='DataTables_Table_0']/tbody/tr/td[@class=' inventory-items-datatable__name']").each do |r|
      if r.text == itemName then
        r.click
        found = true
        break
      end
    end
    found
  end

  def delete item
    # get the contents of the table and map the array to hash
    # search the hash to give the row number and then delete from the grid
  end
end
#Misc Taxable on 10th page

hi

