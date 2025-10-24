module "config_configuration_recorders" {
  source   = "./modules/config_configuration_recorder"
  for_each = var.config_configuration_recorders

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    iam_roles = module.iam_roles
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
