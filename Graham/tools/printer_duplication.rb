require 'selenium-webdriver'
require_relative '../backoffice_actions/backoffice_actions'


class PrinterDuplication
  @bo_actions = BackofficeActions.new
  @bo_actions.login_to_backoffice'test99377'
  @bo_actions.navigate_to_printer_groups_screen
  mac_addresses = @bo_actions.get_mac_printer_settings
  @bo_actions.driver_quit

  @bo_actions.login_to_backoffice'test11227'
  mac_addresses.each_with_index do |mac_address, index|
    @bo_actions.navigate_to_add_new_printer
    @bo_actions.add_new_printer 'Test ' + index.to_s, mac_address
  end
end