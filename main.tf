resource "azurerm_resource_group" "network" {
  name     = "Elite-Development-Network-RG"
  location = "Central US"
}

resource "azurerm_virtual_network" "virtualnetwork" {
  name                = "Elite-Dev-Vnet"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "servers" {
  name                 = "servers"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.virtualnetwork.name
  address_prefixes     = ["10.0.0.0/24"]
}

# tags = {
#   department = "Devops"
#   owner      = "Tamiville"
#   company    = "EliteSolutions LLC"
#   service    = "Elite Technology Service"
# }