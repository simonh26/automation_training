require 'selenium-webdriver'
require '../../automation_training/Graham/backoffice_actions/create_item'
#require 'spec_helper'
require 'pry'

class Login

  @backoffice_helper = BackofficeActions.new
  ['1','2','3','4','5'].each.with_index(1) do|stockitems1, index|
  @backoffice_helper.create_new_item_backoffice stockitems1, index + 20
end


  # driver.get'https://www.getshopkeep.com/ipad-layout'
  # driver.find_element('xpath',"//span[contains(., 'Page 3')]").click
  # source=driver.find_element('xpath', "//span[contains(., 'Test Item A')]")
  # destination= driver.find_element('xpath', "//div[@class='button_page']/div[@class='si-placeholder ui-droppable'][8]")
  # driver.action.click_and_hold(source).move_to(destination).release.perform
end