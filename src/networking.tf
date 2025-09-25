module "vpcs" {
  source = "./modules/_networking/vpc"
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