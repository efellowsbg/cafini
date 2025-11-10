module "db_option_groups" {
  source   = "./modules/db_option_group"
  for_each = var.db_option_groups

  settings        = each.value
  global_settings = local.global_settings

  resources = {
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
