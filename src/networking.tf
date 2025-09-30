module "vpcs" {
  source   = "./modules/_networking/vpc"
  for_each = var.vpcs

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    # ipv4_ipam_pools = module.ipv4_ipam_pools
    # ipv6_ipam_pools = module.ipv6_ipam_pools
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}

module "eips" {
  source   = "./modules/_networking/eip"
  for_each = var.eips

  settings        = each.value
  global_settings = local.global_settings

  resources = {}

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}

module "route_table_associations" {
  source   = "./modules/_networking/route_table_association"
  for_each = var.route_table_associations

  settings        = each.value
  global_settings = local.global_settings

  resources = {}
  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}

module "route_tables" {
  source   = "./modules/_networking/route_table"
  for_each = var.route_tables

  settings        = each.value
  global_settings = local.global_settings

  resources = {}

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}

module "vpc_endpoints" {
  source   = "./modules/_networking/vpc_endpoint"
  for_each = var.vpc_endpoints

  settings        = each.value
  global_settings = local.global_settings

  resources = {}

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}

module "nat_gateways" {
  source   = "./modules/_networking/nat_gateway"
  for_each = var.nat_gateways

  settings        = each.value
  global_settings = local.global_settings

  resources = {}

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}

module "internet_gateways" {
  source   = "./modules/_networking/internet_gateway"
  for_each = var.internet_gateways

  settings        = each.value
  global_settings = local.global_settings

  resources = {}

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}

module "security_groups" {
  source   = "./modules/_networking/security_group"
  for_each = var.security_groups

  settings        = each.value
  global_settings = local.global_settings

  resources = {}

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
