
# Resource Group

module "rg" {
  source = "./modules/rg"
  rg_name = var.rg_name
  rg_location = var.location
  rg_tags = var.tags
}

# Networking

module "vnet" {
  source = "./modules/vnet"
  vnet_name = var.vnet_name
  location = module.rg.rg_location
  rg_name = module.rg.rg_name
  vnet_address_space = ["10.0.0.0/16"]
  tags = var.tags
}

module "subnet" {
  source = "./modules/subnet"
  subnet_name = "${module.vnet.vnet_name}-${var.subnet_name}"
  vnet_name = module.vnet.vnet_name
  rg_name = module.rg.rg_name
  subnet_address_prefixes = ["10.0.0.0/24"]
}