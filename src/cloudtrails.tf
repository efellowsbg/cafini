module "cloudtrails" {
  source   = "./modules/cloudtrail"
  for_each = var.cloudtrails

  settings        = each.value
  global_settings = local.global_settings

  resources = {
    s3_buckets            = module.s3_buckets
    cloudwatch_log_groups = module.cloudwatch_log_groups
    kms_keys              = module.kms_keys
    iam_roles             = module.iam_roles
  }

  # client_config = {
  #   landingzone_key = var.landingzone.key
  # }
}
