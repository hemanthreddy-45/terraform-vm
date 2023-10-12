output "vm_info" {
  description = "Data for the Vm created"
  value = {
    vm_name = azurerm_windows_virtual_machine.vm01.name
    resource_group_name = azurerm_resource_group.rg_spoke.name
    subnet_name = azurerm_subnet.snet_opsera_int_1.name
    vnet_name = azurerm_virtual_network.vnet_spoke.name
    vm_admin_username = azurerm_windows_virtual_machine.vm01.admin_username
    #vm_admin_password = azurerm_windows_virtual_machine.vm01.admin_password
    private_ip = azurerm_network_interface.nic_01.private_ip_address
  }
}

output "vm_admin_password" {
  value = nonsensitive(azurerm_windows_virtual_machine.vm01.admin_password)
}

