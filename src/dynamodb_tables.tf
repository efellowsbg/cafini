module "dynamodb_tables" {
  source   = "./modules/dynamodb"
  for_each = var.dynamodb_tables

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    kms_keys = module.kms_keys
  }
}
