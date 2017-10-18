class CreateItem

  def initialize(driver)
    @driver = driver
  end

  def click_add_item
    @driver.find_element(class: 'add-item').click
    sleep 2
  end

  def switch_to_modal
    @driver.switch_to. active_element # switch to modal
    @driver.find_element(xpath:"//div[@class='item-type-container basic']/button").click #create item
  end

  def item_name(random_number)
    item_description = @driver.find_element(id: 'stock_item_description')
    item_description.send_keys "Basic Item Test" + random_number.to_s
  end

  def item_price(random_number_price)
  item_price = @driver.find_element(id: 'stock_item_price')
  item_price.clear
  item_price.send_keys random_number_price.to_s
  end

  def taxable(zero_or_one)
    taxable = @driver.find_element(id: 'stock_item_taxable')
    select_list = Selenium::WebDriver::Support::Select.new(taxable)
    select_list.select_by(:value, zero_or_one)
  end

  def click_submit_button
    @driver.find_element(id: 'stock_item_submit').click
  end

  def check_success_notice
    @driver.find_element(id: 'notice').text.include? 'Item was successfully created.'
  end

  def create_item(random_number,rand_number_price,taxable,loop_exit_number)
    i = 0
    loop do
      i += 1
      puts i
        click_add_item
        switch_to_modal
        item_name(random_number)
        item_price(rand_number_price)
        taxable(taxable)
        click_submit_button
        check_success_notice

        if i == loop_exit_number
          break
        end
      end
  end
end
