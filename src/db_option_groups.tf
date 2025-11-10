module "db_option_groups" {
  source   = "./modules/db_option_group"
  for_each = var.db_option_groups

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    # db_security_groups = module.db_security_groups
    security_groups = module.security_groups
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
