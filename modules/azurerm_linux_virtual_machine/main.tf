resource "azurerm_network_interface" "nic" {
    name = var.nic_name
    location = var.location
    resource_group_name = var.resource_group_name

ip_configuration {
    name = var.ip_name
    subnet_id = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id = data.azurerm_public_ip.pip.id
}
}

resource "azurerm_linux_virtual_machine" "virtual_machine" {
    name = var.name
    resource_group_name = var.resource_group_name
    location = var.location
    size = var.size
    admin_username = var.admin_username
    admin_password = var.admin_password
    network_interface_ids = [azurerm_network_interface.nic.id]

    os_disk {
        caching = var.caching
        storage_account_type = var.storage_account_type
    }

    source_image_reference {
        publisher = var.publisher
        offer = var.offer
        sku = var.sku
        version = var.image_version
    }
    }
