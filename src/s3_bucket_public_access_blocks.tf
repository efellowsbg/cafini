module "s3_bucket_public_access_blocks" {
  source   = "./modules/s3_bucket_public_access_block"
  for_each = var.s3_bucket_public_access_blocks

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    s3_buckets = module.s3_buckets
  }
}

module "s3_bucket_versionings" {
  source   = "./modules/s3_bucket_versioning"
  for_each = var.s3_bucket_versionings

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    s3_buckets = module.s3_buckets
  }
}

module "s3_bucket_server_side_encryption_configurations" {
  source   = "./modules/s3_bucket_server_side_encryption_configuration"
  for_each = var.s3_bucket_server_side_encryption_configurations

  settings        = each.value
  global_settings = local.global_settings
  resources = {
    kms_keys   = module.kms_keys
    s3_buckets = module.s3_buckets
  }
}
