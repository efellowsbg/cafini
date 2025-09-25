module "kms_keys" {
  source = "./modules/kms_key"
  for_each = var.kms_keys

  settings        = each.value
  global_settings = local.global_settings
  
  resources = {}
}