module "cloudwatch_log_groups" {
  source = "./modules/cloudwatch_log_group"
  for_each = var.cloudwatch_log_groups

	settings        = each.value
  global_settings = local.global_settings

  resources = {
    # kms_keys = module.kms_keys
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}