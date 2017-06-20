
class Helpers
  def select_dropdown(dropdown, value)
    dropDownMenu = driver.find_element(:id, dropdown)
    option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
    option.select_by(:text, value)
  end
end