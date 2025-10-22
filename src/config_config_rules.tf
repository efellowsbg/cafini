module "config_config_rules" {
  source   = "./modules/config_config_rule"
  for_each = var.config_config_rules

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    # kms_keys = module.kms_keys
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
