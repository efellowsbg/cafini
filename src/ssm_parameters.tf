module "ssm_parameters" {
  source   = "./modules/ssm_parameter"
  for_each = var.ssm_parameters

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    kms_keys = module.kms_keys
  }
}
