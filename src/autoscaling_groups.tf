module "autoscaling_groups" {
  source   = "./modules/autoscaling_group"
  for_each = var.autoscaling_groups

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    # kms_keys = module.kms_keys
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
