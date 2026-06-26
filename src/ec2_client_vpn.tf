module "ec2_client_vpn_endpoints" {
  source   = "./modules/ec2_client_vpn_endpoint"
  for_each = var.ec2_client_vpn_endpoints

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    cloudwatch_log_groups = module.cloudwatch_log_groups
    security_groups       = module.security_groups
    vpcs                  = module.vpcs
  }
}

module "ec2_client_vpn_network_associations" {
  source   = "./modules/ec2_client_vpn_network_association"
  for_each = var.ec2_client_vpn_network_associations

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    ec2_client_vpn_endpoints = module.ec2_client_vpn_endpoints
    security_groups          = module.security_groups
    vpcs                     = module.vpcs
  }
}

module "ec2_client_vpn_routes" {
  source   = "./modules/ec2_client_vpn_route"
  for_each = var.ec2_client_vpn_routes

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    ec2_client_vpn_endpoints = module.ec2_client_vpn_endpoints
    vpcs                     = module.vpcs
  }
}

module "ec2_client_vpn_authorization_rules" {
  source   = "./modules/ec2_client_vpn_authorization_rule"
  for_each = var.ec2_client_vpn_authorization_rules

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    ec2_client_vpn_endpoints = module.ec2_client_vpn_endpoints
  }
}
