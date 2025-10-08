module "s3_bucket_lifecycle_configurations" {
  source   = "./modules/s3_bucket_lifecycle_configuration"
  for_each = var.s3_bucket_lifecycle_configurations

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    s3_buckets = module.s3_buckets
  }
}
