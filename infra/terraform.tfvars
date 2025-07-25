resource_group_name = "sachin-rg"
location            = "west us"

virtual_network_name = "vnet-sachin"
address_space        = ["10.0.0.0/16"]

subnet_name      = "subnet-sachin"
address_prefixes = ["10.0.1.0/24"]

virtual_machine_name  = "vnet-sachin"
size                  = "Standard_B1s"
admin_username        = "sachin-devops"
admin_password        = "Sachin.10"

caching              = "ReadWrite"
storage_account_type = "Standard_LRS"

publisher     = "Canonical"
offer         = "0001-com-ubuntu-server-focal"
sku           = "20_04-lts"
image_version = "latest"

nic_name                      = "nic-001"
ip_name                       = "ip-001"
private_ip_address_allocation = "Dynamic"

pip_name          = "pip-001"
allocation_method = "Static"

nsg_name                                 = "nsg-001"
security_rule_name                       = "security_rule_001"
security_rule_priority                   = 100
security_rule_direction                  = "Inbound"
security_rule_access                     = "Allow"
security_rule_protocol                   = "Tcp"
security_rule_source_port_range          = "*"
security_rule_destination_port_range     = "*"
security_rule_source_address_prefix      = "*"
security_rule_destination_address_prefix = "*"

# sql_server_name
# version
# administrator_login
# administrator_login_password

# database_name
# server_id
# sku_name
