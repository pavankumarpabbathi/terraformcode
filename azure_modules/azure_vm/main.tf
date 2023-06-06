resource "azurerm_public_ip" "publicip" {
  count = var.publicip_address_enabled ? 1 : 0  
  name                = "${var.vm_name}-eip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  tags = var.tags
}


resource "azurerm_network_security_group" "sg" {
  name                = "${var.vm_name}-vms-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "Allowwindows"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.tags
}

resource "azurerm_network_interface" "enic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    public_ip_address_id          = var.publicip_address_enabled == true ? azurerm_public_ip.publicip[0].id : null
    name                          = "internal"
    subnet_id                     = var.vm_subnet_name
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}


resource "azurerm_network_interface_security_group_association" "enic_association" {
  network_interface_id      = azurerm_network_interface.enic.id
  network_security_group_id = azurerm_network_security_group.sg.id
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.vm_name
  tags = var.tags
  resource_group_name = var.resource_group_name
  location            = var.location
  vm_size             = var.node_size
  delete_os_disk_on_termination = true
  network_interface_ids = [
    azurerm_network_interface.enic.id,
  ]
  
  os_profile {
    computer_name       = var.vm_name
    admin_username      = var.admin_username
    admin_password      = var.admin_password
  }
  
  os_profile_windows_config {}
  # disable_password_authentication = false
  #source_image_id = var.image_id
  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.vm_name}-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
}

data "azurerm_virtual_machine" "vmdata" {
  depends_on = [azurerm_network_interface.enic, azurerm_network_interface_security_group_association.enic_association, azurerm_virtual_machine.vm]
  name                = var.vm_name
  resource_group_name = var.resource_group_name
}