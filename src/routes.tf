module "routes" {
  source   = "./modules/route"
  for_each = var.routes

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    internet_gateways       = module.internet_gateways
    nat_gateways            = module.nat_gateways
    route_tables            = module.route_tables
    vpc_endpoints           = module.vpc_endpoints
    vpc_peering_connections = module.vpc_peering_connections
  }
}

module "vpc_peering_connections" {
  source   = "./modules/vpc_peering_connection"
  for_each = var.vpc_peering_connections

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    vpcs = module.vpcs
  }
}

module "vpc_peering_connection_options" {
  source   = "./modules/vpc_peering_connection_options"
  for_each = var.vpc_peering_connection_options

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    vpc_peering_connections = module.vpc_peering_connections
  }
}
