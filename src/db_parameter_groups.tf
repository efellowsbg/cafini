module "db_parameter_groups" {
  source   = "./modules/db_parameter_group"
  for_each = var.db_parameter_groups

  settings        = each.value
  global_settings = local.global_settings

  resources = {
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
