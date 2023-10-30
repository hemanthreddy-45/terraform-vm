terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

provider "azurerm" {
  # Configuration options please provide your data to authenticate with Azure 
  features {
  }
}

resource "azurerm_resource_group" "rg_spoke" {
    name = var.rg-name
    location = "CentralIndia"
}



resource "azurerm_virtual_network" "vnet_spoke" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg_spoke.location
  resource_group_name = azurerm_resource_group.rg_spoke.name
  address_space       = var.SubAaddspace
  dns_servers         = var.SubDNSspace

}

resource "azurerm_subnet" "snet_opsera_int_1" {
    name           = var.subnet_name
    resource_group_name = azurerm_resource_group.rg_spoke.name
    address_prefixes = var.SubAaddspace
    virtual_network_name = azurerm_virtual_network.vnet_spoke.name
  }

resource "azurerm_network_interface" "nic_01" {
    name = var.nic_name
    location = azurerm_resource_group.rg_spoke.location
    resource_group_name = azurerm_resource_group.rg_spoke.name

    ip_configuration {
      name = "internal"
      subnet_id = azurerm_subnet.snet_opsera_int_1.id
      private_ip_address_allocation = "Dynamic"
    }
}
  

resource "azurerm_windows_virtual_machine" "vm01" {
   name                    =   var.vm_name  
   location                =   "Central India"
   resource_group_name     =   azurerm_resource_group.rg_spoke.name
   network_interface_ids   =   [ azurerm_network_interface.nic_01.id ] 
   size                    =   "Standard_D2_v2" 
   admin_username          =   var.vm_admin_username 
   admin_password          =   var.vm_admin_password

   boot_diagnostics {}
  

   os_disk   { 
     caching             =   "ReadWrite" 
     storage_account_type   =   "Standard_LRS" 
   } 

   source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

