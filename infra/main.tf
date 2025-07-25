module "resource_group" {
  source   = "../modules/azurerm_resource_group"
  name     = var.resource_group_name
  location = var.location
}

module "virtual_network" {
  source              = "../modules/azurerm_virtual_network"
  depends_on          = [module.resource_group]
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

module "subnet" {
  source               = "../modules/azurerm_subnet"
  depends_on           = [module.virtual_network]
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
}

module "virtual_machine" {
  source                = "../modules/azurerm_linux_virtual_machine"
  depends_on            = [module.subnet]
  name                  = var.virtual_machine_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  subnet_name           = var.subnet_name
  virtual_network_name  = var.virtual_network_name
  pip_name              = var.pip_name

  caching              = var.caching
  storage_account_type = var.storage_account_type

  publisher                     = var.publisher
  offer                         = var.offer
  sku                           = var.sku
  image_version                 = var.image_version
  nic_name                      = var.nic_name
  ip_name                       = var.ip_name
  private_ip_address_allocation = var.private_ip_address_allocation
}

module "public_ip" {
  source              = "../modules/azurerm_public_ip"
  depends_on          = [module.resource_group]
  name                = var.pip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
}

module "network_security_group" {
  source                                   = "../modules/azurerm_network_security_group"
  depends_on                               = [module.resource_group]
  name                                     = var.nsg_name
  location                                 = var.location
  resource_group_name                      = var.resource_group_name
  security_rule_name                       = var.security_rule_name
  security_rule_priority                   = var.security_rule_priority
  security_rule_direction                  = var.security_rule_direction
  security_rule_access                     = var.security_rule_access
  security_rule_protocol                   = var.security_rule_protocol
  security_rule_source_port_range          = var.security_rule_source_port_range
  security_rule_destination_port_range     = var.security_rule_destination_port_range
  security_rule_source_address_prefix      = var.security_rule_source_address_prefix
  security_rule_destination_address_prefix = var.security_rule_destination_address_prefix
}

# module "sql_server" {
#     source = "../modules/azurerm_mssql_server"
#     depends_on = [module.resource_group]
#     name = var.sql_server_name
#     location = var.location
#     resource_group_name = var.resource_group_name
#     version = var.version
#     administrator_login = var.administrator_login
#     administrator_login_password = var.administrator_login_password
# }

# module "sql_database" {
#     source = "../modules/azurerm_mssql_database"
#     depends_on = [module.sql_server]
#     name = var.database_name
#     server_id = var.server_id
#     sku_name = var.sku_name
# }
