variable "resource_group_name" {}
variable "location" {}

variable "virtual_network_name" {}
variable "address_space" {}

variable "subnet_name" {}
variable "address_prefixes" {}

variable "virtual_machine_name" {}
variable "size" {}
variable "admin_username" {}
variable "admin_password" {}

variable "caching" {}
variable "storage_account_type" {}
variable "publisher" {}
variable "offer" {}
variable "sku" {}
variable "image_version" {}

variable "nic_name" {}
variable "ip_name" {}
variable "private_ip_address_allocation" {}

variable "pip_name" {}
variable "allocation_method" {}

variable "nsg_name" {}
variable "security_rule_name" {}
variable "security_rule_priority" {}
variable "security_rule_direction" {}
variable "security_rule_access" {}
variable "security_rule_protocol" {}
variable "security_rule_source_port_range" {}
variable "security_rule_destination_port_range" {}
variable "security_rule_source_address_prefix" {}
variable "security_rule_destination_address_prefix" {}

# variable "sql_server_name" {}
# variable "version" {}
# variable "administrator_login" {}
# variable "administrator_login_password" {}

# variable "database_name" {}
# variable "server_id" {}
# variable "sku_name" {}
