variable "rg-name" {
    type = string
    description = "Enter subnet A name"
    default = "vnet_opsera_in_1"
}

variable "vnet_name" {
    type = string
    description = "Enter subnet A name"
    default = "vnet_opsera_in_1"
}

variable "subnet_name" {
    type = string
    description = "Enter subnet A name"
    default = "snet_opsera_int_1"
}

variable "vm_name" {
    type = string
    description = "Enter subnet A name"
    default = "vm_01"
}

variable "vm_admin_username" {
    type = string
    description = "Enter subnet A name"
    default = "adminuser"
}

variable "vm_admin_password" {
    type = string
    description = "Enter subnet A name"
    default = "Password@2023"
}

variable "SubAaddspace" {
    type = list(string)
    default = [ "10.10.10.0/26" ]
}

variable "SubDNSspace" {
    type = list(string)
    default = ["10.10.0.11", "10.10.0.12"]
}

variable "nic_name" {
    type = string
    description = "Enter subnet A name"
    default = "opsera-nic"
}