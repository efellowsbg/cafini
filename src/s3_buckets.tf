module "s3_buckets" {
  source   = "./modules/s3_bucket"
  for_each = var.s3_buckets

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    kms_keys = module.kms_keys
  }
}
