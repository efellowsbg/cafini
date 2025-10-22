module "config_config_rules" {
  source   = "./modules/config_config_rule"
  for_each = var.config_config_rules

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    lambda_functions = module.lambda_functions
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
