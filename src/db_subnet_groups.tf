module "db_subnet_groups" {
  source   = "./modules/db_subnet_group"
  for_each = var.db_subnet_groups

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    vpcs = module.vpcs
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
